module Language.REL.Domains where

-- | Semantic domain of regular languages.
--
-- A language is represented intensionally as a predicate on strings.
type Language = String -> Bool

