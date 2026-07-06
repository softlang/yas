{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE UndecidableSuperClasses #-}

{-

Well-formedness of DIL MLMs:

* Levels are descending down to zero.
* Each structure name is declared not more than once in a given DIL MLM.
* Each field is defined (introduced) not more than once in any instantiation chain.
* Each field set (assignment) is durability-wise aligned with its definition (introduction).

-}

module Language.DIL.WellFormedness where

import Language.DIL.Syntax

import Data.Kind (Constraint)
import Data.HList

import GHC.TypeLits
  ( Nat
  , type (+)
  , TypeError
  , ErrorMessage(Text, ShowType, (:<>:))
  )

-- Start MLM with "mlm $ ..."
-- An MLM is a sequence (hlist) of levels.
-- Each level consists of a level number and a sequence (hlist) of structure declarations.

mlm :: MLM a => a -> a
mlm = id

-- Type checking MLMs
--
-- Aspects covered:
--
-- * Descending order of levels
-- * Unique structure names across the MLM

class
  ( Levels a
  , LevelsDescending a
  , UniqueStructures a
  ) => MLM a

instance
  ( Levels a
  , LevelsDescending a
  , UniqueStructures a
  ) => MLM a

{-
-- Descending levels
-}

type family LevelsDescending levels :: Constraint where

  LevelsDescending End = ()

  LevelsDescending ((Level 0, decls) :> End) =
    SDecls decls

  LevelsDescending ((Level (m :: Nat), decls1) :> (Level (n :: Nat), decls2) :> levels) =
    ( SDecls decls1
    , m ~ (n + 1)
    , LevelsDescending ((Level n, decls2) :> levels)
    )

  LevelsDescending levels =
    TypeError
      ( 'Text "Malformed DIL MLM levels: "
        ':<>: 'ShowType levels
      )

{-
-- Unique structure declarations:
-- A structure name must not occur more than once in the whole MLM.
-- The check is split into small constraints:
-- * UniqueStructures: recurse over levels
-- * UniqueStructuresInDecls: ensure uniqueness within one level
-- * StructuresAbsentFromLevels: ensure all structures of the current level do not occur later
-- * StructureAbsentFromLevels: ensure one structure does not occur in any later level
-- * StructureAbsentFromDecls: ensure one structure does not occur in a declaration list
-}

type family UniqueStructures levels :: Constraint where

  UniqueStructures End = ()

  UniqueStructures ((Level n, decls) :> levels) =
    ( UniqueStructuresInDecls decls
    , StructuresAbsentFromLevels decls levels
    , UniqueStructures levels
    )

type family UniqueStructuresInDecls decls :: Constraint where

  UniqueStructuresInDecls End = ()

  UniqueStructuresInDecls (SDeclValue '(s, potency, base, fs) :> decls) =
    ( StructureAbsentFromDecls s decls
    , UniqueStructuresInDecls decls
    )

type family StructuresAbsentFromLevels decls levels :: Constraint where

  StructuresAbsentFromLevels End levels = ()

  StructuresAbsentFromLevels (SDeclValue '(s, potency, base, fs) :> decls) levels =
    ( StructureAbsentFromLevels s levels
    , StructuresAbsentFromLevels decls levels
    )

type family StructureAbsentFromLevels s levels :: Constraint where

  StructureAbsentFromLevels s End = ()

  StructureAbsentFromLevels s ((Level n, decls) :> levels) =
    ( StructureAbsentFromDecls s decls
    , StructureAbsentFromLevels s levels
    )

type family StructureAbsentFromDecls s decls :: Constraint where

  StructureAbsentFromDecls s End = ()

  StructureAbsentFromDecls s (SDeclValue '(s, potency, base, fs) :> decls) =
    TypeError
      ( 'Text "Duplicate structure declaration in DIL MLM: "
        ':<>: 'ShowType s
      )

  StructureAbsentFromDecls s (SDeclValue '(s', potency, base, fs) :> decls) =
    StructureAbsentFromDecls s decls
