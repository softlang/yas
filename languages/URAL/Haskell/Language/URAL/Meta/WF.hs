-- BEGIN ...
module Language.URAL.Meta.WF where
import Language.URAL.Syntax (Tag)
import Language.URAL.Meta.Syntax
import Data.List (nub)
import Data.Generics
import Data.Generics.Schemes
-- END ...
-- Well-Formedness of metamodels
ok :: MM -> Bool
ok m = and (map ($m) [
         uniqueTags,
         uniqueSelectors,
         nonMissing,
         singleBase,
         noCycles,
         productive
       ])

-- All type names are declared just once
uniqueTags :: MM -> Bool
uniqueTags m = decls m == nub (decls m)

-- Each record type's selectors are unique
uniqueSelectors :: MM -> Bool
uniqueSelectors m = and (map (\ss -> ss == nub ss) sss)
  where
    sss = everything (++) (mkQ [] (\(RecordType rt) -> [map fst rt])) m

-- All referenced types are declared
nonMissing :: MM -> Bool
nonMissing m = and (map (\t -> elem t (decls m)) (refs m))

-- All types have at most one base
singleBase :: MM -> Bool
singleBase m = subs == nub subs
  where
    subs = concat (map ctags (atypes m))

-- Typing derivation does not contain cycles
noCycles :: MM -> Bool
noCycles m = and (map (noCycle . atag) (atypes m))
  where
    -- No cycle for a given type
    noCycle :: Tag -> Bool
    noCycle t = not (elem t (subs t))
    -- All sub-types of a given type
    subs :: Tag -> [Tag]
    subs t = tsubs (isubs t)
    -- Immediate sub-types
    isubs :: Tag -> [Tag]
    isubs t = maybe [] ctags (atype m t)
    -- Transitive closure of sub-types
    tsubs :: [Tag] -> [Tag]
    tsubs ts = if ts' == []
                 then ts
                 else tsubs (ts++ts')
      where
        ts' = [ t' | t <- ts, t' <- isubs t, not (elem t' ts) ]

-- Make URA evaluation terminate by productive types
productive :: MM -> Bool
productive m = -- ...
-- BEGIN ...
{-
The approach does not guarantee that types are instantiatable.
However, evaluation of URAs is guaranteed to terminate.
-}
  not (or (map redirect (ctypes m)))
  where
    redirect (CType _ (NominalType _)) = True
    redirect _ = False
-- END ...

-- The collection of all declared types
decls :: MM -> [Tag]
decls m = map atag (atypes m) ++ map ctag (ctypes m)

-- The set of all referenced types
refs :: MM -> [Tag]
refs = nub . everything (++) (mkQ [] (\(NominalType t) -> [t]))
