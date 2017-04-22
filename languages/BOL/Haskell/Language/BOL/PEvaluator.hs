module Language.BOL.PEvaluator (
  module Language.BOL.PEvaluator,
  OId,
  EnvV
) where
import qualified Language.BOL.Syntax as BOL
import qualified Language.BOL.ICL as ICL
import Language.BOL.Evaluator (OId, EnvV, Val(..))
import Data.Map hiding (map, foldr)

-- The environment (EnvV is reused)
type Env = (EnvI, EnvP, EnvV)
type EnvI = Map BOL.Class ([OId], ICL.Var) -- Known instances and variable for the **rest**, if any
type EnvP = Map OId (Map BOL.Prop ICL.Term) -- Properties are mapped to values or variables

-- The repo as encoded in the range of EnvI
repo :: ([OId], ICL.Var) -> [OId]
repo (os, v) = os ++ let (ICL.BoundedSetType os') = snd v in os'

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

pevalForm :: BOL.Form -> Env -> ICL.Form
pevalForm (BOL.Conj phi1 phi2) env = ICL.conj (pevalForm phi1 env) (pevalForm phi2 env)
pevalForm (BOL.Disj phi1 phi2) env = ICL.disj (pevalForm phi1 env) (pevalForm phi2 env)
pevalForm (BOL.Exists e x phi) env@(ei, ep, ev) =
 case pevalExpr e env of
   -- Quantification over a list of object ids as in the case of evaluation 
   (ICL.ValTerm (ListVal os)) ->
     ICL.or [ pevalForm phi (env' o) | o <- os ]
   -- Quantification over a (bounded) variable as in the case of translation
   (ICL.VarTerm v@(_, ICL.BoundedSetType os)) ->
     ICL.or [ ICL.and [ICL.ElOf (ObjectVal o) v, pevalForm phi (env' o)] | o <- os ]
 where
  env' o = (ei, ep, (fst ev, insert x o (snd ev)))
-- "<": translation adopted modulo projection and injection
pevalForm (BOL.Lt e1 e2) env
 = ICL.lt (pevalExpr e1 env) (pevalExpr e2 env)

-- Expressions: evaluation / translation adopted modulo projection and injection
pevalExpr :: BOL.Expr -> Env -> ICL.Term
pevalExpr (BOL.Int i) env = ICL.ValTerm (IntVal i)
pevalExpr (BOL.Var x) (_, _, (_, m)) = ICL.ValTerm (ObjectVal (m!x))
pevalExpr BOL.Self (_, _, (Just v, _)) = ICL.ValTerm (ObjectVal v)
pevalExpr (BOL.Dot e p) env@(_, ep, _)
 | ICL.ValTerm (ObjectVal o) <- pevalExpr e env
 = ep!o!p
