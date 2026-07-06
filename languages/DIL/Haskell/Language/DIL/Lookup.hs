{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE AllowAmbiguousTypes #-}

module Language.DIL.Lookup where

import Language.DIL.Syntax
import Data.HList
import Data.Kind (Type)
import Data.Proxy (Proxy(..))
import GHC.TypeLits

-- Type-level lookup for a structure
lookupStructure
  :: forall s levels n decl.
     ( Structure s
     , Levels levels
     , LookupStructure s levels ~ '(n, decl)
     , KnownNat n
     , SDecl decl
     )
  => Proxy s
  -> levels
  -> (Level n, Proxy decl)
lookupStructure _ _ = (Level, sdecl @decl)

-- Type-level search across levels
type family LookupStructure s levels :: (Nat, Type) where
  LookupStructure s End = TypeError ('Text "Unknown structure in MLM: " ':<>: 'ShowType s)
  LookupStructure s ((Level n, decls) :> levels) = LookupStructureCase s n (LookupStructureInDecls s decls) levels

-- Type-level case: found at this level or proceed to next level
type family LookupStructureCase s n found levels :: (Nat, Type) where
  LookupStructureCase s n ('Just decl) levels = '(n, decl)
  LookupStructureCase s n 'Nothing levels = LookupStructure s levels

-- Type-level search inside one level's structure declarations
type family LookupStructureInDecls s decls :: Maybe Type where
  LookupStructureInDecls s End = 'Nothing
  LookupStructureInDecls s (SDeclValue '(s, potency, base, fs) :> decls) = 'Just (SDeclValue '(s, potency, base, fs))
  LookupStructureInDecls s (decl :> decls) = LookupStructureInDecls s decls

{- ------------------------------------------------------------

Lookup for fields

------------------------------------------------------------ -}

-- Type-level lookup for any field declaration in an assumed structure.
-- This intentionally ignores whether the declaration is a def or a set.
lookupField
  :: forall s f levels n d t.
     ( Structure s
     , Field f
     , Levels levels
     , LookupField s f levels ~ '(n, FProxy f d t)
     , KnownNat n
     )
  => Proxy s
  -> Proxy f
  -> levels
  -> (Level n, FProxy f d t)
lookupField _ _ _ = (Level, Proxy)

-- Type-level lookup for a field definition in an assumed structure.
lookupFieldDef
  :: forall s f levels n d t.
     ( Structure s
     , Field f
     , Levels levels
     , LookupFieldDef s f levels ~ '(n, FProxy f d t)
     , KnownNat n
     )
  => Proxy s
  -> Proxy f
  -> levels
  -> (Level n, FProxy f d t)
lookupFieldDef _ _ _ = (Level, Proxy)

-- Value-level lookup for a field assignment in an assumed structure.
-- Unlike lookupField/lookupFieldDef, this returns the assigned set value.
lookupFieldSet
  :: forall s f levels n d t.
     ( Structure s
     , Field f
     , Levels levels
     , LookupFieldSet s f levels ~ '(n, FProxy f d t)
     , LookupFieldSetValue s f levels n d t
     , KnownNat n
     )
  => Proxy s
  -> Proxy f
  -> levels
  -> (Level n, t)
lookupFieldSet _ _ levels = lookupFieldSetValue @s @f levels

-- Type-level lookup for any field in the assumed structure
type family LookupField s f levels :: (Nat, Type) where
  LookupField s f levels = LookupFieldInStructure s f (LookupStructure s levels)

-- Type-level lookup for a field definition in the assumed structure
type family LookupFieldDef s f levels :: (Nat, Type) where
  LookupFieldDef s f levels = LookupFieldWithForm 'FFormDef s f levels

-- Type-level lookup for a field assignment in the assumed structure
type family LookupFieldSet s f levels :: (Nat, Type) where
  LookupFieldSet s f levels = LookupFieldWithForm 'FFormSet s f levels

-- Type-level lookup for a field declaration of a specific form in the assumed structure
type family LookupFieldWithForm form s f levels :: (Nat, Type) where
  LookupFieldWithForm form s f levels = LookupFieldWithFormInStructure form s f (LookupStructure s levels)

-- Type-level search in the field declarations of the located structure
type family LookupFieldInStructure s f lookup :: (Nat, Type) where
  LookupFieldInStructure s f '(n, SDeclValue '(s, potency, base, fs)) = LookupFieldCase s f n (LookupFieldInDecls f fs)

-- Type-level search for a specific declaration form in the field declarations of the located structure
type family LookupFieldWithFormInStructure form s f lookup :: (Nat, Type) where
  LookupFieldWithFormInStructure form s f '(n, SDeclValue '(s, potency, base, fs)) =
    LookupFieldWithFormCase form s f n (LookupFieldWithFormInDecls form f fs)

-- Type-level case: found the field or report an error for the assumed structure
type family LookupFieldCase s f n found :: (Nat, Type) where
  LookupFieldCase s f n ('Just fproxy) = '(n, fproxy)
  LookupFieldCase s f n 'Nothing =
    TypeError ('Text "Unknown field in assumed structure " ':<>: 'ShowType s ':<>: 'Text ": " ':<>: 'ShowType f)

-- Type-level case: found the field form or report an error for the assumed structure
type family LookupFieldWithFormCase form s f n found :: (Nat, Type) where
  LookupFieldWithFormCase form s f n ('Just fproxy) = '(n, fproxy)
  LookupFieldWithFormCase 'FFormDef s f n 'Nothing =
    TypeError ('Text "Unknown field definition in assumed structure " ':<>: 'ShowType s ':<>: 'Text ": " ':<>: 'ShowType f)
  LookupFieldWithFormCase 'FFormSet s f n 'Nothing =
    TypeError ('Text "Unknown field assignment in assumed structure " ':<>: 'ShowType s ':<>: 'Text ": " ':<>: 'ShowType f)

-- Type-level search inside one structure's field declarations
type family LookupFieldInDecls f decls :: Maybe Type where
  LookupFieldInDecls f End = 'Nothing
  LookupFieldInDecls f (FDecl form f (Durability d) t :> decls) = 'Just (FProxy f d t)
  LookupFieldInDecls f (decl :> decls) = LookupFieldInDecls f decls

-- Type-level search inside one structure's field declarations, restricted to a declaration form
type family LookupFieldWithFormInDecls form f decls :: Maybe Type where
  LookupFieldWithFormInDecls form f End = 'Nothing
  LookupFieldWithFormInDecls form f (FDecl form f (Durability d) t :> decls) = 'Just (FProxy f d t)
  LookupFieldWithFormInDecls form f (decl :> decls) = LookupFieldWithFormInDecls form f decls


{- ------------------------------------------------------------

Value-level lookup support for field assignments

------------------------------------------------------------ -}

class LookupFieldSetValue s f levels n d t | s f levels -> n d t where
  lookupFieldSetValue :: levels -> (Level n, t)

instance
  ( LookupFieldSetValueCase s f n decls levels (LookupStructureInDecls s decls) n' d t
  ) => LookupFieldSetValue s f ((Level n, decls) :> levels) n' d t where
  lookupFieldSetValue levels = lookupFieldSetValueCase @s @f @n @decls @levels @(LookupStructureInDecls s decls) levels

class LookupFieldSetValueCase s f n decls levels found n' d t | s f n decls levels found -> n' d t where
  lookupFieldSetValueCase :: ((Level n, decls) :> levels) -> (Level n', t)

instance
  ( KnownNat n
  , LookupStructureFields s decls fs
  , LookupFieldSetInDeclsValue f fs d t
  ) => LookupFieldSetValueCase s f n decls levels ('Just (SDeclValue '(s, potency, base, fs))) n d t where
  lookupFieldSetValueCase ((_, decls) :> _) = (Level, lookupFieldSetInDeclsValue @f (lookupStructureFields @s decls))

instance
  ( LookupFieldSetValue s f levels n' d t
  ) => LookupFieldSetValueCase s f n decls levels 'Nothing n' d t where
  lookupFieldSetValueCase ((_level, _decls) :> levels) = lookupFieldSetValue @s @f levels

-- Classify one structure declaration before choosing the runtime branch.
-- This replaces the old overlapping ``this head matches`` / ``skip head``
-- instances with a closed type family and two disjoint case instances.
type family LookupStructureFieldsHead s decl :: Maybe Type where
  LookupStructureFieldsHead s (SDeclValue '(s, potency, base, fs)) = 'Just fs
  LookupStructureFieldsHead s decl = 'Nothing

class LookupStructureFields s decls fs | s decls -> fs where
  lookupStructureFields :: decls -> fs

instance
  ( LookupStructureFieldsCase (LookupStructureFieldsHead s decl) s decl decls fs
  ) => LookupStructureFields s (decl :> decls) fs where
  lookupStructureFields decls =
    lookupStructureFieldsCase @(LookupStructureFieldsHead s decl) @s @decl @decls decls

class LookupStructureFieldsCase found s decl decls fs | found s decl decls -> fs where
  lookupStructureFieldsCase :: (decl :> decls) -> fs

instance LookupStructureFieldsCase ('Just fs) s (SDeclValue '(s, potency, base, fs)) decls fs where
  lookupStructureFieldsCase (SDeclValue fs :> _) = fs

instance
  ( LookupStructureFields s decls fs
  ) => LookupStructureFieldsCase 'Nothing s decl decls fs where
  lookupStructureFieldsCase (_ :> decls) = lookupStructureFields @s decls

-- Classify one field declaration before choosing the runtime branch.
-- The returned type-level pair carries the durability and value type of the set.
type family LookupFieldSetInDeclsValueHead f decl :: Maybe (Nat, Type) where
  LookupFieldSetInDeclsValueHead f (FDecl 'FFormSet f (Durability d) t) = 'Just '(d, t)
  LookupFieldSetInDeclsValueHead f decl = 'Nothing

class LookupFieldSetInDeclsValue f decls d t | f decls -> d t where
  lookupFieldSetInDeclsValue :: decls -> t

instance
  ( LookupFieldSetInDeclsValueCase (LookupFieldSetInDeclsValueHead f decl) f decl decls d t
  ) => LookupFieldSetInDeclsValue f (decl :> decls) d t where
  lookupFieldSetInDeclsValue decls =
    lookupFieldSetInDeclsValueCase @(LookupFieldSetInDeclsValueHead f decl) @f @decl @decls decls

class LookupFieldSetInDeclsValueCase found f decl decls d t | found f decl decls -> d t where
  lookupFieldSetInDeclsValueCase :: (decl :> decls) -> t

instance LookupFieldSetInDeclsValueCase ('Just '(d, t)) f (FDecl 'FFormSet f (Durability d) t) decls d t where
  lookupFieldSetInDeclsValueCase (FDeclSet v _ :> _) = v

instance
  ( LookupFieldSetInDeclsValue f decls d t
  ) => LookupFieldSetInDeclsValueCase 'Nothing f decl decls d t where
  lookupFieldSetInDeclsValueCase (_ :> decls) = lookupFieldSetInDeclsValue @f decls
