import System.Environment (getArgs)
import System.Directory
import System.IO
import Medusa

closedDirectory = "closed"

timestampAndClose fileName = do
  medusaTimestampFile fileName
  renameFile fileName (closedDirectory++"/"++fileName)

main = do
  [fileName] <- getArgs
  dirExists <- doesDirectoryExist closedDirectory
  if dirExists
    then (timestampAndClose fileName)
    else (print $ "Directory `"++closedDirectory++"/` does not exist")
