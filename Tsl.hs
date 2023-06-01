import Token 
import Grammar
import Eval
import System.Environment
import Control.Exception
import System.IO
import Types

main :: IO ()
main = catch main' noParse

main' = do (fileName : _ ) <- getArgs 
           sourceText <- readFile fileName
           let tokens = alexScanTokens sourceText
           let parsedProg = parseCalc (alexScanTokens sourceText)
           let types = checkType parsedProg
           eval (parsedProg, [], [])
               where eval :: State -> IO()
                     eval x = do y <- eval1 x
                                 if halt x y
                                 then return () 
                                 else eval y

noParse :: ErrorCall -> IO ()
noParse e = do let err =  show e
               hPutStr stderr err
               return ()
