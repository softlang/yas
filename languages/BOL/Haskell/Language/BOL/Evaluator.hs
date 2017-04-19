module Language.BOL.Evaluator where
import Language.BOL.Syntax
import Data.Map hiding (map)

-- The environment
type Env = (EnvI, EnvP, EnvV)
type EnvI = Map Class [OId] -- Map classes to instances
type EnvP = Map OId (Map Prop Val) -- Map instances to properties to values
type EnvV = (Maybe OId, Map Var OId) -- Map self and variables
type OId = String -- Object ids are Strings
data Val = IntVal Int | OIdVal OId | ListVal [OId] -- Values are Ints, object ids, and lists

evalInv :: Inv -> Env -> Bool
evalInv (c, f) (ei, ep, ev)
 = and [ evalForm f (env' o) | o <- ei!c ]
 where
  env' o = (ei, ep, (Just o, snd ev))

evalForm :: Form -> Env -> Bool
evalForm (Exists e x f) env@(ei, ep, ev)
 | ListVal os <- evalExpr e env
 = or [ evalForm f (ei, ep, env' o) | o <- os ]
 where
  env' o = (fst ev, insert x o (snd ev))
evalForm (Lt e1 e2) env
 | IntVal i1 <- evalExpr e1 env
 , IntVal i2 <- evalExpr e2 env
 = i1 < i2

evalExpr :: Expr -> Env -> Val
evalExpr (Int i) _ = IntVal i
evalExpr (Var x) (_, _, (_, m)) = OIdVal (m!x)
evalExpr Self (_, _, (v, _)) | Just v' <- v = OIdVal v'
evalExpr (Dot e p) env@(_, ep, _)
 | OIdVal o <- evalExpr e env
 = ep!o!p
