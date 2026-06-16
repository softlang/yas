module Language.REL.Combinators where

import Language.REL.Domains

-- | The empty language.
empty :: Language
empty _ =
  False

-- | The language containing only the empty string.
eps :: Language
eps s =
  null s

-- | The singleton language containing one character.
lit :: Char -> Language
lit c s =
  s == [c]

-- | Union of languages.
alt :: Language -> Language -> Language
alt l1 l2 s =
  l1 s || l2 s

-- | Concatenation of languages.
seq :: Language -> Language -> Language
seq l1 l2 s =
  or
    [ l1 s1 && l2 s2
    | (s1, s2) <- splits s
    ]

-- | Kleene star of a language.
star :: Language -> Language
star l s =
  null s || or
    [ l s1 && star l s2
    | (s1, s2) <- properSplits s
    ]

-- | All splits of a string, including empty prefixes and suffixes.
splits :: String -> [(String, String)]
splits s =
  [ splitAt i s
  | i <- [0 .. length s]
  ]

-- | Splits with a non-empty prefix.
--
-- This ensures that star terminates even when the body language accepts
-- the empty string.
properSplits :: String -> [(String, String)]
properSplits s =
  [ splitAt i s
  | i <- [1 .. length s]
  ]
