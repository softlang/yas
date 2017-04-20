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
type EnvP = Map OId (Map BOL.Prop ValVar) -- Properties are mapped to values or variables
type ValVar = Either Val ICL.Var -- Union of values and variables

-- The repo as encoded in the range of EnvI
repo :: ([OId], ICL.Var) -> [OId]
repo (os, v) = os ++ let (ICL.BoundedPowerType os') = snd v in os'

-- Partial projection of ValVars to Language.BOL.Operations' terms
valVarToTerm :: ValVar -> ICL.Term
valVarToTerm (Left (IntVal l)) = ICL.Int l
valVarToTerm (Left (OIdVal o)) = ICL.OId o
valVarToTerm (Right v) = ICL.Var v

pevalInv :: BOL.Inv -> Env -> ICL.Form
pevalInv (c, f) (ei, ep, ev)
 = ICL.and [ ICL.impl (elOf o c) (pevalForm f (env' o)) | o <- repo (ei!c) ]
 where
  env' o = (ei, ep, (Just o, snd ev))
  elOf o c
   -- Test whether repo member is known to be actual instance
   = if elem o (fst (ei!c))
       -- No membership test as in the case of evaluation
       then ICL.Bool True
       -- Membership test on variable for actual instances as in the case of translation
       else ICL.ElOf o (snd (ei!c))

pevalForm :: BOL.Form -> Env -> ICL.Form
pevalForm (BOL.Exists e x f) env@(ei, ep, ev) =
 case pevalExpr e env of
   -- Quantification over a list of object ids as in the case of evaluation 
   (Left (ListVal os)) ->
     ICL.or [ pevalForm f (env' o) | o <- os ]
   -- Quantification over a (bounded) variable as in the case of translation
   (Right v@(_, ICL.BoundedListType c)) ->
     let os = repo (ei!c) in
       ICL.or [ ICL.and [ICL.ElOf o v, pevalForm f (env' o)] | o <- os ]
 where
  env' o = (ei, ep, (fst ev, insert x o (snd ev)))
-- "<": translation adopted modulo projection and injection
pevalForm (BOL.Lt e1 e2) env
 = ICL.lt (f e1) (f e2)
 where
  f e = valVarToTerm (pevalExpr e env)

-- Expressions: evaluation / translation adopted modulo projection and injection
pevalExpr :: BOL.Expr -> Env -> ValVar
pevalExpr (BOL.Int i) env = Left (IntVal i)
pevalExpr (BOL.Var x) (_, _, (_, m)) = Left (OIdVal (m!x))
pevalExpr BOL.Self (_, _, (Just v, _)) = Left (OIdVal v)
pevalExpr (BOL.Dot e p) env@(_, ep, _)
 | Left (OIdVal o) <- pevalExpr e env
 = ep!o!p
