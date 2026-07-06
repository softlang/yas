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
* Instantiation chains are acyclic.
* Each field is defined (introduced) not more than once in any instantiation chain.
* Each field is set (assigned) in a manner aligned durability-wise and type-wise with its definition (introduction).

-}

module Language.DIL.WellFormedness where

import Language.DIL.Syntax

import Data.Kind (Constraint)
import Data.HList

import GHC.TypeLits
  ( Nat
  , type (+)
  , CmpNat
  , TypeError
  , ErrorMessage(Text, ShowType, (:<>:))
  )

-- Check all constraints with "mlm $ ..."

mlm :: MLM a => a -> a
mlm = id

class
  ( Levels a
  , LevelsDescending a
  , UniqueStructures a
  , NoInstantiationCycles a
  , UniqueFieldDefsInChains a
  , FieldSetsAlignedWithDefs a
  ) => MLM a

instance
  ( Levels a
  , LevelsDescending a
  , UniqueStructures a
  , NoInstantiationCycles a
  , UniqueFieldDefsInChains a
  , FieldSetsAlignedWithDefs a
  ) => MLM a

{-
------------------------------------------------------------
Descending levels
------------------------------------------------------------
-}

type family LevelsDescending levels :: Constraint where

  LevelsDescending End =
    ()

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
------------------------------------------------------------
Unique structure declarations
------------------------------------------------------------
-}

type family UniqueStructures levels :: Constraint where

  UniqueStructures End =
    ()

  UniqueStructures ((Level n, decls) :> levels) =
    ( UniqueStructuresInDecls decls
    , StructuresAbsentFromLevels decls levels
    , UniqueStructures levels
    )

type family UniqueStructuresInDecls decls :: Constraint where

  UniqueStructuresInDecls End =
    ()

  UniqueStructuresInDecls (SDeclValue '(s, potency, base, fs) :> decls) =
    ( StructureAbsentFromDecls s decls
    , UniqueStructuresInDecls decls
    )

type family StructuresAbsentFromLevels decls levels :: Constraint where

  StructuresAbsentFromLevels End levels =
    ()

  StructuresAbsentFromLevels (SDeclValue '(s, potency, base, fs) :> decls) levels =
    ( StructureAbsentFromLevels s levels
    , StructuresAbsentFromLevels decls levels
    )

type family StructureAbsentFromLevels s levels :: Constraint where

  StructureAbsentFromLevels s End =
    ()

  StructureAbsentFromLevels s ((Level n, decls) :> levels) =
    ( StructureAbsentFromDecls s decls
    , StructureAbsentFromLevels s levels
    )

type family StructureAbsentFromDecls s decls :: Constraint where

  StructureAbsentFromDecls s End =
    ()

  StructureAbsentFromDecls s (SDeclValue '(s, potency, base, fs) :> decls) =
    TypeError
      ( 'Text "Duplicate structure declaration in DIL MLM: "
        ':<>: 'ShowType s
      )

  StructureAbsentFromDecls s (SDeclValue '(s', potency, base, fs) :> decls) =
    StructureAbsentFromDecls s decls

{-
------------------------------------------------------------
Shared MLM helpers
------------------------------------------------------------
-}

-- Flatten the MLM into one HList of structure declarations.

type family AllSDecls levels where

  AllSDecls End =
    End

  AllSDecls ((Level n, decls) :> levels) =
    Append decls (AllSDecls levels)

-- HList append.

type family Append xs ys where

  Append End ys =
    ys

  Append (x :> xs) ys =
    x :> Append xs ys

-- Lookup a structure declaration by structure name.

type family LookupSDecl s decls where

  LookupSDecl s End =
    TypeError
      ( 'Text "Unknown structure in DIL MLM instantiation chain: "
        ':<>: 'ShowType s
      )

  LookupSDecl s (SDeclValue '(s, potency, base, fs) :> decls) =
    SDeclValue '(s, potency, base, fs)

  LookupSDecl s (SDeclValue '(s', potency, base, fs) :> decls) =
    LookupSDecl s decls

{-
------------------------------------------------------------
No instantiation cycles
------------------------------------------------------------
-}

type family NoInstantiationCycles levels :: Constraint where
  NoInstantiationCycles levels =
    NoInstantiationCyclesInSDecls (AllSDecls levels) (AllSDecls levels)

type family NoInstantiationCyclesInSDecls decls allDecls :: Constraint where

  NoInstantiationCyclesInSDecls End allDecls =
    ()

  NoInstantiationCyclesInSDecls (SDeclValue '(s, potency, base, fs) :> decls) allDecls =
    ( NoInstantiationCycleFrom s allDecls End
    , NoInstantiationCyclesInSDecls decls allDecls
    )

type family NoInstantiationCycleFrom s allDecls visited :: Constraint where
  NoInstantiationCycleFrom s allDecls visited =
    ( StructureNotVisited s visited
    , NoInstantiationCycleFrom' (LookupSDecl s allDecls) allDecls (s :> visited)
    )

type family NoInstantiationCycleFrom' sdecl allDecls visited :: Constraint where

  NoInstantiationCycleFrom' (SDeclValue '(s, potency, 'Nothing, fs)) allDecls visited =
    ()

  NoInstantiationCycleFrom' (SDeclValue '(s, potency, 'Just base, fs)) allDecls visited =
    NoInstantiationCycleFrom base allDecls visited

type family StructureNotVisited s visited :: Constraint where

  StructureNotVisited s End =
    ()

  StructureNotVisited s (s :> visited) =
    TypeError
      ( 'Text "Instantiation cycle in DIL MLM involving structure: "
        ':<>: 'ShowType s
      )

  StructureNotVisited s (s' :> visited) =
    StructureNotVisited s visited

{-
------------------------------------------------------------
Unique field introductions along instantiation chains
------------------------------------------------------------

A field is introduced by `def`.

A field assignment by `set` does not introduce the field and is therefore
ignored by this constraint.

For every declared structure S, we compute the chain:

    S -> base(S) -> base(base(S)) -> ... -> root

and check that the field names introduced along that chain are unique.

This is intentionally not global field-name uniqueness. Sibling branches may
introduce the same field independently because they do not occur in the same
instantiation chain.
-}

type family UniqueFieldDefsInChains levels :: Constraint where
  UniqueFieldDefsInChains levels =
    UniqueFieldDefsInSDecls (AllSDecls levels) (AllSDecls levels)

type family UniqueFieldDefsInSDecls decls allDecls :: Constraint where

  UniqueFieldDefsInSDecls End allDecls =
    ()

  UniqueFieldDefsInSDecls (SDeclValue '(s, potency, base, fs) :> decls) allDecls =
    ( UniqueFieldDefsInChain s allDecls
    , UniqueFieldDefsInSDecls decls allDecls
    )

type family UniqueFieldDefsInChain s allDecls :: Constraint where
  UniqueFieldDefsInChain s allDecls =
    UniqueFields (FieldDefsInChain s allDecls)

type family FieldDefsInChain s allDecls where
  FieldDefsInChain s allDecls =
    FieldDefsInChainSafe s allDecls End

type family FieldDefsInChainSafe s allDecls visited where
  FieldDefsInChainSafe s allDecls visited =
    FieldDefsInChainSafe'
      s
      (LookupSDecl s allDecls)
      allDecls
      visited

type family FieldDefsInChainSafe' s sdecl allDecls visited where

  FieldDefsInChainSafe' s sdecl allDecls (s :> visited) =
    TypeError
      ( 'Text "Instantiation cycle in DIL MLM involving structure: "
        ':<>: 'ShowType s
      )

  FieldDefsInChainSafe' s (SDeclValue '(s, potency, 'Nothing, fs)) allDecls visited =
    FieldDefs fs

  FieldDefsInChainSafe' s (SDeclValue '(s, potency, 'Just base, fs)) allDecls visited =
    Append
      (FieldDefs fs)
      (FieldDefsInChainSafe base allDecls (s :> visited))

type family FieldDefs fs where

  FieldDefs End =
    End

  FieldDefs (FDecl 'FFormDef f durability t :> fs) =
    f :> FieldDefs fs

  FieldDefs (FDecl 'FFormSet f durability t :> fs) =
    FieldDefs fs

type family UniqueFields fs :: Constraint where

  UniqueFields End =
    ()

  UniqueFields (f :> fs) =
    ( FieldAbsentFromFields f fs
    , UniqueFields fs
    )

type family FieldAbsentFromFields f fs :: Constraint where

  FieldAbsentFromFields f End =
    ()

  FieldAbsentFromFields f (f :> fs) =
    TypeError
      ( 'Text "Duplicate field introduction in DIL MLM instantiation chain: "
        ':<>: 'ShowType f
      )

  FieldAbsentFromFields f (f' :> fs) =
    FieldAbsentFromFields f fs

{-
------------------------------------------------------------
Field assignments are aligned with field definitions
------------------------------------------------------------

For every assignment `set f` in structure S:

1. Follow the instantiation chain from S upward.
2. Find the unique definition `def f d t`.
3. Let k be the number of instantiation edges from S to the defining structure.
4. Require k == d.
5. Require the assignment type to equal the definition type.

The uniqueness of field definitions in chains makes the found definition
unambiguous.
-}

type family FieldSetsAlignedWithDefs levels :: Constraint where
  FieldSetsAlignedWithDefs levels =
    FieldSetsAlignedInSDecls (AllSDecls levels) (AllSDecls levels)

type family FieldSetsAlignedInSDecls decls allDecls :: Constraint where

  FieldSetsAlignedInSDecls End allDecls =
    ()

  FieldSetsAlignedInSDecls (SDeclValue '(s, potency, base, fs) :> decls) allDecls =
    ( FieldSetsAlignedInFDecls s fs allDecls
    , FieldSetsAlignedInSDecls decls allDecls
    )

type family FieldSetsAlignedInFDecls s fs allDecls :: Constraint where

  FieldSetsAlignedInFDecls s End allDecls =
    ()

  FieldSetsAlignedInFDecls s (FDecl 'FFormDef f durability t :> fs) allDecls =
    FieldSetsAlignedInFDecls s fs allDecls

  FieldSetsAlignedInFDecls s (FDecl 'FFormSet f durability t :> fs) allDecls =
    ( FieldSetAlignedWithDef f t s allDecls
    , FieldSetsAlignedInFDecls s fs allDecls
    )

type family FieldSetAlignedWithDef f setType s allDecls :: Constraint where
  FieldSetAlignedWithDef f setType s allDecls =
    FieldSetAlignedWithDefFrom f setType s s allDecls End 0

type family FieldSetAlignedWithDefFrom f setType origin s allDecls visited distance :: Constraint where
  FieldSetAlignedWithDefFrom f setType origin s allDecls visited distance =
    ( StructureNotVisited s visited
    , FieldSetAlignedWithDefInSDecl
        f
        setType
        origin
        s
        (LookupSDecl s allDecls)
        allDecls
        (s :> visited)
        distance
    )

type family FieldSetAlignedWithDefInSDecl f setType origin s sdecl allDecls visited distance :: Constraint where

  FieldSetAlignedWithDefInSDecl
    f
    setType
    origin
    s
    (SDeclValue '(s, potency, base, fs))
    allDecls
    visited
    distance =
      FieldSetAlignedWithDefAt
        f
        setType
        origin
        s
        (FieldDefInfo f fs)
        base
        allDecls
        visited
        distance

type family FieldSetAlignedWithDefAt f setType origin s maybeDefInfo base allDecls visited distance :: Constraint where

  FieldSetAlignedWithDefAt
    f
    setType
    origin
    s
    ('Just '(defDurability, defType))
    base
    allDecls
    visited
    distance =
      ( RequireSameNat
          distance
          defDurability
          ( 'Text "Field assignment is not durability-aligned with its definition. Field: "
            ':<>: 'ShowType f
            ':<>: 'Text ", assigned in structure: "
            ':<>: 'ShowType origin
            ':<>: 'Text ", defined in structure: "
            ':<>: 'ShowType s
            ':<>: 'Text ", assignment distance: "
            ':<>: 'ShowType distance
            ':<>: 'Text ", declared durability: "
            ':<>: 'ShowType defDurability
          )
      , RequireSameType
          setType
          defType
          ( 'Text "Field assignment is not type-aligned with its definition. Field: "
            ':<>: 'ShowType f
            ':<>: 'Text ", assigned in structure: "
            ':<>: 'ShowType origin
            ':<>: 'Text ", defined in structure: "
            ':<>: 'ShowType s
            ':<>: 'Text ", assignment type: "
            ':<>: 'ShowType setType
            ':<>: 'Text ", definition type: "
            ':<>: 'ShowType defType
          )
      )

  FieldSetAlignedWithDefAt
    f
    setType
    origin
    s
    'Nothing
    'Nothing
    allDecls
    visited
    distance =
      TypeError
        ( 'Text "Field assignment has no corresponding field definition in its instantiation chain. Field: "
          ':<>: 'ShowType f
          ':<>: 'Text ", assigned in structure: "
          ':<>: 'ShowType origin
        )

  FieldSetAlignedWithDefAt
    f
    setType
    origin
    s
    'Nothing
    ('Just base)
    allDecls
    visited
    distance =
      FieldSetAlignedWithDefFrom f setType origin base allDecls visited (distance + 1)

-- Find the durability and type of a field definition in one structure
-- declaration's field list. Assignments are ignored.

type family FieldDefInfo f fs where

  FieldDefInfo f End =
    'Nothing

  FieldDefInfo f (FDecl 'FFormDef f (Durability durability) t :> fs) =
    'Just '(durability, t)

  FieldDefInfo f (FDecl 'FFormDef f' durability t :> fs) =
    FieldDefInfo f fs

  FieldDefInfo f (FDecl 'FFormSet f' durability t :> fs) =
    FieldDefInfo f fs

-- Produce a custom type error instead of exposing a raw type-level natural
-- equality failure.

type family RequireSameNat actual expected message :: Constraint where
  RequireSameNat actual expected message =
    RequireSameNat' (CmpNat actual expected) actual expected message

type family RequireSameNat' ordering actual expected message :: Constraint where

  RequireSameNat' 'EQ actual expected message =
    ()

  RequireSameNat' ordering actual expected message =
    TypeError message

-- Produce a custom type error instead of exposing a raw type equality failure.

type family RequireSameType actual expected message :: Constraint where

  RequireSameType actual actual message =
    ()

  RequireSameType actual expected message =
    TypeError message
