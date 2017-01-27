module Medusa where

import Data.Time
import System.IO
import System.Directory

medusaTimeFormat :: UTCTime -> String
medusaTimeFormat = formatTime defaultTimeLocale (iso8601DateFormat Nothing)

medusaTimestampFile :: String -> IO ()
medusaTimestampFile fileName = do
  t <- getCurrentTime
  withFile fileName AppendMode ((flip hPutStrLn) (medusaTimeFormat t))

timestampAndMove dir fileName = do
  dirExists <- doesDirectoryExist dir
  if dirExists
    then
    do 
      medusaTimestampFile fileName
      renameFile fileName (dir++"/"++fileName)
    else (print $ "Directory `"++dir++"/` does not exist")
