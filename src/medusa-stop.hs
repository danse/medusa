import System.Environment (getArgs)
import System.IO
import Medusa

main = do
  [fileName] <- getArgs
  timestampAndMove "closed" fileName
