module Language.BIPL.Analysis.Interval.BasicAnalysis where

import Language.BIPL.Algebra.Signature
import Language.BIPL.Syntax (UOp(..), BOp(..))
import Language.BIPL.Analysis.Interval.Domain
import Data.CPO

-- | Interval analysis as abstract interpretation.
--
-- The analysis reuses the generic BIPL algebraic interpretation scheme. Integer
-- values are approximated by intervals; Boolean values are approximated as
-- known true, known false, or unknown. Loops are analyzed with widening.
type Property = AbsValue

type VarIntervals = Env

algebra :: Alg VarIntervals Property
algebra = a
  where
    a = Alg {
      skip' = id,
      assign' = \x f m -> insertVar x (f m) m,
      seq' = flip (.),
      if' = \f g h m ->
        case f m of
          BoolValue (KnownBool True)  -> g m
          BoolValue (KnownBool False) -> h m
          BoolValue BottomBool        -> bottom
          BoolValue TopBool           -> g m `lub` h m
          BottomValue                 -> bottom
          _                           -> g m `lub` h m,
      while' = \f g -> loopWithWidening f g,
      intconst' = \i -> const (IntValue (singleton i)),
      var' = \x -> lookupVar x,
      unary' = \o f m ->
        case (o, f m) of
          (Negate, IntValue i) -> IntValue (negInterval i)
          (Not, BoolValue b) -> BoolValue (notBool b)
          (_, BottomValue) -> BottomValue
          _ -> TopValue,
      binary' = \o f g m ->
        case (o, f m, g m) of
          (Add, IntValue x, IntValue y) -> IntValue (addInterval x y)
          (Sub, IntValue x, IntValue y) -> IntValue (subInterval x y)
          (Mul, IntValue x, IntValue y) -> IntValue (mulInterval x y)
          (Lt,  IntValue x, IntValue y) -> BoolValue (ltInterval x y)
          (Leq, IntValue x, IntValue y) -> BoolValue (leqInterval x y)
          (Eq,  IntValue x, IntValue y) -> BoolValue (eqInterval x y)
          (Geq, IntValue x, IntValue y) -> BoolValue (leqInterval y x)
          (Gt,  IntValue x, IntValue y) -> BoolValue (ltInterval y x)
          (Eq,  BoolValue x, BoolValue y) -> BoolValue (eqBool x y)
          (And, BoolValue x, BoolValue y) -> BoolValue (andBool x y)
          (Or,  BoolValue x, BoolValue y) -> BoolValue (orBool x y)
          (_, BottomValue, _) -> BottomValue
          (_, _, BottomValue) -> BottomValue
          _ -> TopValue
    }

-- | A simple widening-based loop analyzer.
--
-- The result is the loop-head invariant: the entry state joined with all states
-- that can be reached by executing the body while the condition may be true.
-- We do not refine the exit state with the negated guard; this keeps the example
-- deliberately small and close to the existing sign-analysis examples.
loopWithWidening :: Obs Env AbsValue -> Trafo Env -> Trafo Env
loopWithWidening condition body input = iterateLoop 0 input
  where
    iterateLoop :: Int -> Env -> Env
    iterateLoop n current =
      let next = step current
          accelerated = if n < 3 then next else widenEnv current next
       in if accelerated == current || n >= maxIterations
            then accelerated
            else iterateLoop (n + 1) accelerated

    step :: Env -> Env
    step current =
      case condition current of
        BoolValue (KnownBool False) -> current
        BoolValue BottomBool -> current
        BoolValue (KnownBool True) -> input `lub` body current
        BoolValue TopBool -> input `lub` body current
        BottomValue -> current
        _ -> input `lub` body current

maxIterations :: Int
maxIterations = 50

eqBool :: AbsBool -> AbsBool -> AbsBool
eqBool BottomBool _ = BottomBool
eqBool _ BottomBool = BottomBool
eqBool (KnownBool x) (KnownBool y) = KnownBool (x == y)
eqBool _ _ = TopBool
