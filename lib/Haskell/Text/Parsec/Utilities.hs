{-# LANGUAGE FlexibleContexts #-}
module Text.Parsec.Utilities where
import Language.Haskell.TH
import Text.Parsec (parse, spaces, eof, SourcePos, setPosition)
import Text.Parsec.String (Parser)
import Text.Parsec.Pos (newPos)
import Control.Exception (throwIO)

-- Convert TH position into something usable by Parsec
location' :: Q SourcePos
location' = f <$> location
  where
    f :: Loc -> SourcePos
    f loc = uncurry (newPos (loc_filename loc)) (loc_start loc)

-- Parse a quasiquotation
parseQ :: Parser a -> String -> Q a
parseQ p str = do
    l <- location'
    runIO $ parseIO (setPosition l *> (completeParser p)) str
  where
    parseIO p str =
      case parse p "" str of
        Left err -> throwIO (userError (show err))
        Right a  -> return a

-- Parser with surrounding spaces including EOF
completeParser :: Parser a -> Parser a
completeParser p = spaces *> p <* eof
