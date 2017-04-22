module Language.BOL.PEvaluatorWithPaths (
  module Language.BOL.PEvaluatorWithPaths,
  OId,
  EnvV
) where
import qualified Language.BOL.Syntax as BOL
import qualified Language.BOL.ICL as ICL
import Language.BOL.Evaluator (OId, EnvV, Val(..))
import Language.BOL.PEvaluator (Env, repo)
import Data.Map hiding (map, foldr)

-- A data structure for unrolling variables in a term context
type Terms = [(ICL.Form, ICL.Term)]
single :: ICL.Term -> Terms
single t = [(ICL.Bool True, t)]

-- Perfect code clone from Language.BOL.PEvaluator
pevalInv :: BOL.Inv -> Env -> ICL.Form
pevalInv (c, phi) (ei, ep, ev)
 = ICL.and [ ICL.impl (elOf o c) (pevalForm phi (env' o)) | o <- repo (ei!c) ]
 where
  env' o = (ei, ep, (Just o, snd ev))
  elOf o c
   -- Test whether repo member is known to be actual instance
   = if elem o (fst (ei!c))
       -- No membership test as in the case of evaluation
       then ICL.Bool True
       -- Membership test on variable for actual instances as in the case of translation
       else ICL.ElOf (ObjectVal o) (snd (ei!c))

-- Code clone from Language.BOL.PEvaluator modulo lifting
pevalForm :: BOL.Form -> Env -> ICL.Form
pevalForm (BOL.Conj phi1 phi2) env = ICL.conj (pevalForm phi1 env) (pevalForm phi2 env)
pevalForm (BOL.Disj phi1 phi2) env = ICL.disj (pevalForm phi1 env) (pevalForm phi2 env)
pevalForm (BOL.Exists e x phi) env@(ei, ep, ev) = liftUnaryPredicate f (pevalExpr e env)
 where
  f t = case t of
   (ICL.ValTerm (ListVal os)) ->
     ICL.or [ pevalForm phi (env' o) | o <- os ]
   (ICL.VarTerm v@(_, ICL.BoundedSetType os)) ->
     ICL.or [ ICL.and [ICL.ElOf (ObjectVal o) v, pevalForm phi (env' o)] | o <- os ]
  env' o = (ei, ep, (fst ev, insert x o (snd ev)))
pevalForm (BOL.Lt e1 e2) env
 = liftBinaryPredicate ICL.lt (pevalExpr e1 env) (pevalExpr e2 env)

-- Lift unary predicate to Terms
liftUnaryPredicate :: (ICL.Term -> ICL.Form) -> Terms -> ICL.Form
liftUnaryPredicate f ts = ICL.and [ ICL.impl phi (f t) | (phi, t) <- ts ] 

-- Lift binary predicate to Terms
liftBinaryPredicate :: (ICL.Term -> ICL.Term -> ICL.Form) -> Terms -> Terms -> ICL.Form
liftBinaryPredicate f ts1 ts2 = ICL.and [ ICL.impl (ICL.conj phi phi') (f t1 t2) | (phi, t1) <- ts1, (phi', t2) <- ts2 ] 

-- Expressions: evaluation / translation adopted modulo projection and injection
pevalExpr :: BOL.Expr -> Env -> Terms
pevalExpr (BOL.Int i) env = single (ICL.ValTerm (IntVal i))
pevalExpr (BOL.Var x) (_, _, (_, m)) = single (ICL.ValTerm (ObjectVal (m!x)))
pevalExpr BOL.Self (_, _, (Just v, _)) = single (ICL.ValTerm (ObjectVal v))
pevalExpr (BOL.Dot e p) env@(_, ep, _)
 = concat (map (\(phi, t) -> conjoin phi (f t)) (pevalExpr e env))
 where
  f (ICL.ValTerm (ObjectVal o)) = single (ep!o!p)
  f (ICL.VarTerm v) = map (\(phi, (ICL.ValTerm (ObjectVal o))) -> (phi, ep!o!p)) (unroll v)

-- Unroll a variable into cases for its domains
unroll :: ICL.Var -> Terms
unroll v
 = case v of
    (_, ICL.BoundedIntType is) -> map (f . IntVal) is
    (_, ICL.BoundedRefType os) -> map (f . ObjectVal) os
    -- TODO: a case for collections
 where
  f l = (ICL.EqTo v l, ICL.ValTerm l)

-- Conjoin given cases with a given constraint
conjoin :: ICL.Form -> Terms -> Terms
conjoin phi = map (\(phi', t) -> (ICL.conj phi phi', t))
