module Language.STL.Interpreter where

import Prelude hiding (drop, filter, fst, id, map, seq, snd, take)

import Language.STL.Syntax
import Language.STL.Domains
import Language.STL.Combinators

-- | Denotational semantics of STL.
--
-- The interpreter maps syntax to meanings. All semantic work is
-- delegated to the meaning-level combinators in Language.STL.Combinators.
interpret :: STL -> Transducer
interpret Id =
  id

interpret (Map f) =
  map f

interpret (Filter p) =
  filter p

interpret (Take n) =
  take n

interpret (Drop n) =
  drop n

interpret (Seq s1 s2) =
  seq (interpret s1) (interpret s2)

interpret (Par f s1 s2) =
  par f (interpret s1) (interpret s2)

-- | Run an STL program on an input stream.
run :: STL -> Stream -> Stream
run =
  interpret
