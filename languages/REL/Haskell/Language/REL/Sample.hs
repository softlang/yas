module Language.REL.Sample where

import Language.REL.Syntax

-- | a
a :: REL
a =
  Lit 'a'

-- | b
b :: REL
b =
  Lit 'b'

-- | ab
ab :: REL
ab =
  Seq a b

-- | a|b
aOrB :: REL
aOrB =
  Alt a b

-- | a*
manyA :: REL
manyA =
  Star a

-- | ab*
aThenManyB :: REL
aThenManyB =
  Seq a (Star b)

-- | (a|b)*
manyAOrB :: REL
manyAOrB =
  Star aOrB

-- | a(b|a)*
sample :: REL
sample =
  Seq a (Star (Alt b a))

