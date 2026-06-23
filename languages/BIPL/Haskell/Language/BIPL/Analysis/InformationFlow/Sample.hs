module Language.BIPL.Analysis.InformationFlow.Sample where

import Data.Map (fromList)
import Language.BIPL.Syntax
import Language.BIPL.Analysis.InformationFlow.Domain

-- public := secret + 1
-- This is an explicit high-to-low flow.
explicitLeak :: Stmt
explicitLeak =
  Assign "public" (Binary Add (Var "secret") (IntConst 1))

explicitLeakStore :: Env
explicitLeakStore =
  fromList [("secret", High), ("public", Low)]

explicitLeakSinks :: PublicSinks
explicitLeakSinks = ["public"]

-- if secret then public := 1 else public := 0
-- The assigned values are Low, but the control decision is High.
implicitLeak :: Stmt
implicitLeak =
  If
    (Var "secret")
    (Assign "public" (IntConst 1))
    (Assign "public" (IntConst 0))

implicitLeakStore :: Env
implicitLeakStore =
  fromList [("secret", High), ("public", Low)]

implicitLeakSinks :: PublicSinks
implicitLeakSinks = ["public"]

-- public := lowInput + 1
-- A safe public computation.
safePublicComputation :: Stmt
safePublicComputation =
  Assign "public" (Binary Add (Var "lowInput") (IntConst 1))

safePublicComputationStore :: Env
safePublicComputationStore =
  fromList [("lowInput", Low), ("public", Low)]

safePublicComputationSinks :: PublicSinks
safePublicComputationSinks = ["public"]

-- tmp := secret; public := tmp
-- Taint propagates through intermediate variables.
highIntermediate :: Stmt
highIntermediate =
  Seq
    (Assign "tmp" (Var "secret"))
    (Assign "public" (Var "tmp"))

highIntermediateStore :: Env
highIntermediateStore =
  fromList [("secret", High), ("tmp", Low), ("public", Low)]

highIntermediateSinks :: PublicSinks
highIntermediateSinks = ["public"]

-- while secret do public := 1
-- The loop guard creates an implicit flow to the public sink.
loopLeak :: Stmt
loopLeak =
  While
    (Var "secret")
    (Assign "public" (IntConst 1))

loopLeakStore :: Env
loopLeakStore =
  fromList [("secret", High), ("public", Low)]

loopLeakSinks :: PublicSinks
loopLeakSinks = ["public"]

-- secretOut := secret + 1
-- High data may flow to another High/private variable without a public leak.
privateComputation :: Stmt
privateComputation =
  Assign "secretOut" (Binary Add (Var "secret") (IntConst 1))

privateComputationStore :: Env
privateComputationStore =
  fromList [("secret", High), ("secretOut", High)]

privateComputationSinks :: PublicSinks
privateComputationSinks = ["public"]
