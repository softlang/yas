module Language.BOL.PEvaluator (
  module Language.BOL.PEvaluator,
  OId,
  EnvV
) where
import qualified Language.BOL.Syntax as BOL
import qualified Language.BOL.Operations as Ops
import Language.BOL.Evaluator (OId, EnvV, Val(..))
import Data.Map hiding (map, foldr)

-- The environment (EnvV is reused)
type Env = (EnvI, EnvP, EnvV)
type EnvI = Map BOL.Class ([OId], Ops.Var) -- Known instances and variable for the **rest**, if any
type EnvP = Map OId (Map BOL.Prop ValVar) -- Properties are mapped to values or variables
type ValVar = Either Val Ops.Var -- Union of values and variables

-- The repo as encoded in the range of EnvI
repo :: ([OId], Ops.Var) -> [OId]
repo (os, v) = os ++ let (Ops.BoundedPowerType os') = snd v in os'

-- Partial projection of ValVars to Language.BOL.Operations' terms
valVarToTerm :: ValVar -> Ops.Term
valVarToTerm (Left (IntVal l)) = Ops.Int l
valVarToTerm (Left (OIdVal o)) = Ops.OId o
valVarToTerm (Right v) = Ops.Var v

pevalInv :: BOL.Inv -> Env -> Ops.Form
pevalInv (c, f) (ei, ep, ev)
 = Ops.and [ Ops.impl (elOf o c) (pevalForm f (env' o)) | o <- repo (ei!c) ]
 where
  env' o = (ei, ep, (Just o, snd ev))
  elOf o c
   -- Test whether repo member is known to be actual instance
   = if elem o (fst (ei!c))
       -- No membership test as in the case of evaluation
       then Ops.Bool True
       -- Membership test on variable for actual instances as in the case of translation
       else Ops.ElOf o (snd (ei!c))

pevalForm :: BOL.Form -> Env -> Ops.Form
pevalForm (BOL.Exists e x f) env@(ei, ep, ev) =
 case pevalExpr e env of
   -- Quantification over a list of object ids as in the case of evaluation 
   (Left (ListVal os)) ->
     Ops.or [ pevalForm f (env' o) | o <- os ]
   -- Quantification over a (bounded) variable as in the case of translation
   (Right v@(_, Ops.BoundedListType c)) ->
     let os = repo (ei!c) in
       Ops.or [ Ops.and [Ops.ElOf o v, pevalForm f (env' o)] | o <- os ]
 where
  env' o = (ei, ep, (fst ev, insert x o (snd ev)))
-- "<": translation adopted modulo projection and injection
pevalForm (BOL.Lt e1 e2) env
 = Ops.lt (f e1) (f e2)
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
