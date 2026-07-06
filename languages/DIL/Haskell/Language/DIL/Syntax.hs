{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE AllowAmbiguousTypes #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FlexibleContexts #-}

module Language.DIL.Syntax where

import Data.Kind (Type)
import GHC.TypeLits (KnownNat, Nat, natVal, type (+), TypeError, ErrorMessage(ShowType, Text, (:<>:)))
import Data.Proxy (Proxy(..))
import Data.HList

-- Express level with ..., "level @2", "level @1", "level @0".
-- The level numbers in the sequence of structures must be decreasing down to zero.
level :: KnownNat n => Level n
level = Level

-- Declare a root structure with "root @StructureTagType @PotentcyNat hlist-of-field-declarations"
root :: forall s (n::Nat) fs. (Structure s, FDecls fs) => fs -> SDeclValue '(s, Potency n, 'Nothing, fs)
root = SDeclValue

-- Declare a non-root structure; compared to root, there is an extra argument for the base structure
instanceOf :: forall s1 (n::Nat) s2 fs. (Structure s1, Structure s2, FDecls fs) => fs -> SDeclValue '(s1, Potency n, 'Just s2, fs)
instanceOf = SDeclValue

-- Define (introduce) a field with its type and durability
def :: forall f (n::Nat) t. (Field f, FType t) => FDecl 'FFormDef f (Durability n) t
def = FDeclDef Proxy

-- Set (assign to) a field a value; assume durability is 0
set :: forall f t. (Field f, FType t) => t -> FDecl 'FFormSet f (Durability 0) t
set v = FDeclSet v Proxy

-- Tagging class for names of structures and fields.
-- Users opt in by declaring instances for each structure and field tag.
class Structure s
class Field f

-- Levels are type-level naturals
data Level (n :: Nat) where
  Level :: KnownNat n => Level n

instance KnownNat n => Show (Level n) where
  show (_ :: Level n) = show (natVal (Proxy @n))

-- Potencies are type-level naturals
data Potency (n :: Nat) where
  Potency :: KnownNat n => Potency n

instance KnownNat n => Show (Potency n) where
  show (_ :: Potency n) = show (natVal (Proxy @n))

-- Durabilities are type level numbers
data Durability (n :: Nat) where
  Durability :: KnownNat n => Durability n

instance KnownNat n => Show (Durability n) where
  show (_ :: Durability n) = show (natVal (Proxy @n))

-- Syntax of MLMs
class HList a => Levels a
instance Levels End
instance (SDecls decls, Levels levels) => Levels ((Level (n::Nat), decls) :> levels)

-- Syntax of lists of structure decls
class HList a => SDecls a
instance SDecls End
instance (SDecl decl, SDecls decls) => SDecls (decl :> decls)

-- Runtime representation of a structure declaration.  Unlike a Proxy,
-- this keeps the field-declaration list, so set-field values remain available
-- for value-level lookup.
data SDeclValue :: (Type, Type, Maybe Type, Type) -> Type where
  SDeclValue :: fs -> SDeclValue '(s, Potency n, base, fs)

-- What's a structure declaration?
class SDecl a where sdecl :: Proxy a
instance (Structure s, FDecls fs) => SDecl (SDeclValue '(s, Potency n, 'Nothing, fs)) where sdecl = Proxy
instance (Structure s1, Structure s2, FDecls fs) => SDecl (SDeclValue '(s1, Potency n, 'Just s2, fs)) where sdecl = Proxy

{- ------------------------------------------------------------

Helpers for representation

------------------------------------------------------------ -}

-- Representation of field declaration proxies
type FProxy f (n::Nat) t = Proxy '(f, Durability n, t)

-- Forms of field declarations
data FForm
  = FFormDef
  | FFormSet

-- Representation of field declarations
data FDecl :: FForm -> Type -> Type -> Type -> Type where
  FDeclDef
    :: (Field f, FType t)
    => FProxy f (n::Nat) t
    -> FDecl 'FFormDef f (Durability n) t
  FDeclSet
    :: (Field f, FType t)
    => t
    -> FProxy f (n::Nat) t
    -> FDecl 'FFormSet f (Durability n) t

-- Permitted field types
class FType t
instance FType Int
instance FType Double
instance FType String

-- Type checking lists of field decls
class HList a => FDecls a
instance FDecls End
instance (Field f, FType t, FDecls decls) => FDecls (FDecl form f n t :> decls)
