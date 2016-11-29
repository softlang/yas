module FsmlAcceptor where

import Language.FSML.Acceptor
import Text.Parsec (parse)
import Text.Parsec.Utilities (completeParser)
import System.Environment (getArgs)
import System.IO (readFile)
import System.Exit (exitSuccess, exitFailure)

main :: IO ()
main = do
  [file] <- getArgs
  text <- readFile file
  case parse (completeParser fsm >> return ()) "" text of
    (Right ()) -> exitSuccess
    _ -> exitFailure
