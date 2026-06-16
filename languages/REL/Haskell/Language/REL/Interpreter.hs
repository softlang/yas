module Language.REL.Interpreter where

import Prelude hiding (seq)

import Language.REL.Syntax
import Language.REL.Domains
import Language.REL.Combinators

-- | Denotational semantics of REL.
--
-- The interpreter is syntax-directed, but all semantic work is delegated
-- to the meaning-level combinators.
accepts :: REL -> Language
accepts Empty =
  empty

accepts Eps =
  eps

accepts (Lit c) =
  lit c

accepts (Alt r1 r2) =
  alt (accepts r1) (accepts r2)

accepts (Seq r1 r2) =
  seq (accepts r1) (accepts r2)

accepts (Star r) =
  star (accepts r)
