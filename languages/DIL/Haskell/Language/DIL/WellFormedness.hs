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
* Each field is set (assigned) in a manner aligned durability-wise with its definition (introduction).

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

-- Check all constraints with "mlm $ ..."

mlm :: MLM a => a -> a
mlm = id

class
  ( Levels a
  , LevelsDescending a
  , UniqueStructures a
  , NoInstantiationCycles a
  , UniqueFieldDefsInChains a
  ) => MLM a

instance
  ( Levels a
  , LevelsDescending a
  , UniqueStructures a
  , NoInstantiationCycles a
  , UniqueFieldDefsInChains a
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

A structure name must not occur more than once in the whole MLM.
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

Every structure induces an instantiation chain:

    S -> base(S) -> base(base(S)) -> ...

A well-formed chain must eventually reach a root structure, that is, a
structure whose base is 'Nothing.

We detect cycles by carrying an HList of already visited structure names.
If we encounter the same structure name again, the chain is cyclic.
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

The traversal is cycle-safe even though NoInstantiationCycles is also an
explicit MLM constraint. This avoids relying on GHC reducing superclass
constraints in any particular order.
-}

type family UniqueFieldDefsInChains levels :: Constraint where
  UniqueFieldDefsInChains levels =
    UniqueFieldDefsInSDecls (AllSDecls levels) (AllSDecls levels)

-- Check every structure declaration against the complete declaration
-- environment.

type family UniqueFieldDefsInSDecls decls allDecls :: Constraint where

  UniqueFieldDefsInSDecls End allDecls =
    ()

  UniqueFieldDefsInSDecls (SDeclValue '(s, potency, base, fs) :> decls) allDecls =
    ( UniqueFieldDefsInChain s allDecls
    , UniqueFieldDefsInSDecls decls allDecls
    )

-- Compute the field definitions along one instantiation chain and require
-- their names to be unique.

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

-- Extract field names introduced with `def`.
-- Ignore field assignments with `set`.

type family FieldDefs fs where

  FieldDefs End =
    End

  FieldDefs (FDecl 'FFormDef f durability t :> fs) =
    f :> FieldDefs fs

  FieldDefs (FDecl 'FFormSet f durability t :> fs) =
    FieldDefs fs

-- Require uniqueness of field names in an HList.

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
