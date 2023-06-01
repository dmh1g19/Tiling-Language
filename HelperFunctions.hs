module HelperFunctions where

import Data.Char (digitToInt)

getFromFile :: FilePath -> IO [[Int]]
getFromFile fileName = do
    content <- readFile (fileName ++ ".tl")
    return $ map (map digitToInt) $ lines content

