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

interpret (Fst s) =
  fst (interpretPair s)

interpret (Snd s) =
  snd (interpretPair s)

interpret (Merge s1 s2) =
  merge (interpret s1) (interpret s2)

-- | Pair-valued interpretation for fan-out.
--
-- This keeps the ordinary interpretation first-order:
--
--   interpret :: STL -> Stream -> Stream
--
-- while still allowing Par to represent stream-level branching.
interpretPair :: STL -> Stream -> (Stream, Stream)
interpretPair (Par s1 s2) =
  par (interpret s1) (interpret s2)

interpretPair s =
  par (interpret s) (interpret s)

-- | Run an STL program on an input stream.
run :: STL -> Stream -> Stream
run =
  interpret

