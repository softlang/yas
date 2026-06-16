module Language.STL.Domains where

-- | Semantic domain of streams.
type Stream =
  [Int]

-- | Semantic domain of stream transformers.
type Transducer =
  Stream -> Stream

