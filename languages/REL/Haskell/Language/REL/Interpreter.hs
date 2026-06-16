module Language.REL.Interpreter where

import Prelude hiding (seq)

import Language.REL.Syntax
import Language.REL.Domains
import Language.REL.Combinators

-- | Denotational semantics of REL.
--
-- The interpreter is syntax-directed, but all semantic work is delegated
-- to the meaning-level combinators.
interpret :: REL -> Language
interpret Empty =
  empty

interpret Eps =
  eps

interpret (Lit c) =
  lit c

interpret (Alt r1 r2) =
  alt (interpret r1) (interpret r2)

interpret (Seq r1 r2) =
  seq (interpret r1) (interpret r2)

interpret (Star r) =
  star (interpret r)

-- | Membership test.
accepts :: REL -> String -> Bool
accepts r =
  interpret r

