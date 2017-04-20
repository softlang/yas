module Language.BOL.Translator (
  module Language.BOL.Translator,
  OId,
  EnvV
) where
import qualified Language.BOL.Syntax as BOL
import qualified Language.BOL.ICL as ICL
import Language.BOL.Evaluator (OId, EnvV)
import Data.Map hiding (map, foldr)

-- The environment (EnvV is reused)
type Env = (EnvI, EnvP, EnvV)
type EnvI = Map BOL.Class ICL.Var -- Map classes to variables
type EnvP = Map OId (Map BOL.Prop ICL.Var) -- Map properties of instances to variables

-- The repo as encoded in the range of EnvI
repo :: ICL.Var -> [OId]
repo v = let (ICL.BoundedSetType os) = snd v in os

-- Consider all objects from repo.
-- Construct formula for conjunction.
-- Guard each element by membership test on variable for actual instances.
transInv :: BOL.Inv -> Env -> ICL.Form
transInv (c, f) (ei, ep, ev)
 = ICL.and [ ICL.impl (ICL.ElOf o (ei!c)) (transForm f (env' o)) | o <- repo (ei!c) ]
 where
  env' o = (ei, ep, (Just o, snd ev)) 

transForm :: BOL.Form -> Env -> ICL.Form
-- Consider all objects from repo.
-- Construct formula for disjunction.
-- Guard each element by membership test on list-typed variable.
transForm (BOL.Exists e x f) env@(ei, ep, ev)
 | ICL.Var v@(_, ICL.BoundedSetType os) <- transExpr e env
 = ICL.or [ ICL.and [ICL.ElOf o v, transForm f (env' o)] | o <- os ] 
 where
  env' o = (ei, ep, (fst ev, insert x o (snd ev)))
-- "<": construct formula for comparison
transForm (BOL.Lt e1 e2) env = ICL.lt (transExpr e1 env) (transExpr e2 env)

-- Translation equals evaluation modulo projection and injection
transExpr :: BOL.Expr -> Env -> ICL.Term
transExpr (BOL.Int l) _ = ICL.Int l
transExpr (BOL.Var x) (_, _, (_, m)) = ICL.OId (m!x)
transExpr BOL.Self (_, _, (Just v, _)) = ICL.OId v
-- TODO: Dot also needs a Var case when e is more complex.
transExpr (BOL.Dot e p) env@(_, ep, _)
 | ICL.OId o <- transExpr e env
 = ICL.Var (ep!o!p)
