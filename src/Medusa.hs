module Medusa where

import Data.Time
import System.IO

medusaTimeFormat :: UTCTime -> String
medusaTimeFormat = formatTime defaultTimeLocale (iso8601DateFormat Nothing)

medusaTimestampFile :: String -> IO ()
medusaTimestampFile fileName = do
  t <- getCurrentTime
  withFile fileName AppendMode ((flip hPutStrLn) (medusaTimeFormat t))
