module Language.BOL.Evaluator where
import Language.BOL.Syntax
import Data.Map hiding (map)

-- The environment
type Env = (EnvI, EnvP, EnvV)
type EnvI = Map Class [OId] -- Map classes to instances
type EnvP = Map OId (Map Prop Val) -- Map instances to properties to values
type EnvV = (Maybe OId, Map Var OId) -- Map self and variables
type OId = String -- Object ids are Strings
data Val = IntVal Int | BoolVal Bool | ObjectVal OId | ListVal [OId] -- Values are Ints, object ids, and lists
 deriving (Show, Eq)

evalInv :: Inv -> Env -> Bool
evalInv (c, phi) (ei, ep, ev)
 = and [ evalForm phi (env' o) | o <- ei!c ]
 where
  env' o = (ei, ep, (Just o, snd ev))

evalForm :: Form -> Env -> Bool
evalForm (Conj phi1 phi2) env = evalForm phi1 env && evalForm phi2 env
evalForm (Disj phi1 phi2) env = evalForm phi1 env || evalForm phi2 env
evalForm (Exists e x phi) env@(ei, ep, ev)
 | ListVal os <- evalExpr e env
 = or [ evalForm phi (ei, ep, env' o) | o <- os ]
 where
  env' o = (fst ev, insert x o (snd ev))
evalForm (Lt e1 e2) env
 | IntVal i1 <- evalExpr e1 env
 , IntVal i2 <- evalExpr e2 env
 = i1 < i2

evalExpr :: Expr -> Env -> Val
evalExpr (Int i) _ = IntVal i
evalExpr (Var x) (_, _, (_, m)) = ObjectVal (m!x)
evalExpr Self (_, _, (v, _)) | Just v' <- v = ObjectVal v'
evalExpr (Dot e p) env@(_, ep, _)
 | ObjectVal o <- evalExpr e env
 = ep!o!p
