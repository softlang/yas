module Language.BIPL.Analysis.TypeState.BasicAnalysis where

import Language.BIPL.Algebra.Signature
import Language.BIPL.Syntax (UOp(..), BOp(..))
import Language.BIPL.Analysis.TypeState.Domain
import Data.CPO

-- | Type-state analysis as abstract interpretation.
--
-- The analysis reuses the generic BIPL algebraic interpretation scheme. Values
-- are abstract types, and stores are abstract type environments.
type Property = TypeState
type VarTypes = TypeEnv

algebra :: Alg VarTypes Property
algebra = a
  where
    a = Alg {
      skip' = id,

      assign' = \x f m ->
        case f m of
          TypeError -> markError (insertType x TypeError m)
          ty -> insertType x ty m,

      seq' = flip (.),

      if' = \f g h m ->
        case f m of
          BoolType -> g m `lub` h m
          BottomType -> bottom
          TypeError -> markError m
          _ -> markError m,

      while' = \f g -> fixType (\x -> if' a f (x . g) id) id,

      intconst' = \_ -> const IntType,

      var' = \x m ->
        case lookupType x m of
          BottomType -> TypeError
          ty -> ty,

      unary' = \o f m ->
        case (o, f m) of
          (Negate, IntType) -> IntType
          (Not, BoolType) -> BoolType
          (_, BottomType) -> BottomType
          (_, TypeError) -> TypeError
          _ -> TypeError,

      binary' = \o f g m ->
        case (o, f m, g m) of
          (Add, IntType, IntType) -> IntType
          (Sub, IntType, IntType) -> IntType
          (Mul, IntType, IntType) -> IntType

          (Lt, IntType, IntType) -> BoolType
          (Leq, IntType, IntType) -> BoolType
          (Eq, IntType, IntType) -> BoolType
          (Geq, IntType, IntType) -> BoolType
          (Gt, IntType, IntType) -> BoolType

          (Eq, BoolType, BoolType) -> BoolType
          (And, BoolType, BoolType) -> BoolType
          (Or, BoolType, BoolType) -> BoolType

          (_, BottomType, _) -> BottomType
          (_, _, BottomType) -> BottomType
          (_, TypeError, _) -> TypeError
          (_, _, TypeError) -> TypeError
          _ -> TypeError
    }

-- | Iterate a store transformer until it stabilizes for the current input.
-- This local copy keeps TypeState independent of the Sign-analysis folder.
fixType :: Eq a => ((a -> a) -> a -> a) -> (a -> a) -> a -> a
fixType h i x = limit (iterate h i)
  where
    limit (b1:b2:bs) =
      if b1 x == b2 x
        then b1 x
        else limit (b2:bs)
    limit _ = error "fixType: impossible finite iterate list"
