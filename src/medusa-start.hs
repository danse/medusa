import System.Environment (getArgs)
import System.IO
import Medusa

main = do
  [fileName] <- getArgs
  medusaTimestampFile fileName
