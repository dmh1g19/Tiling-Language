import Token
import Grammar
import Types
import Eval 
import System.Environment
import Control.Exception
import System.IO

main :: IO ()
main = catch main' noParse

main' = do (fileName : _ ) <- getArgs
           sourceText <- readFile fileName
           putStrLn ("Plain text: " ++ sourceText)
          
           let tokens = alexScanTokens sourceText
           putStrLn ("Tokens: " ++ (show tokens) ++ "\n")

           let parsed = parseCalc (alexScanTokens sourceText)
           putStrLn ("Parsed: " ++ (show parsed) ++ "\n")

           let typed = (result (typeof (parsed,[])))
           putStrLn ("Type check: " ++ (show typed) ++ "\n")
           
           putStrLn ("Evaluated: ")
           result <- evalLoop parsed
           print result

           --let a@(x,y,z) = eval1 (parsed,[],[])
           --putStrLn ("Evaluated: " ++ (show a) ++ "\n")
          
          -- Finally, perform evaluation (one step)
           --x <- eval1 (parsed,[],[])
           --putStrLn $ show x


noParse :: ErrorCall -> IO ()
noParse e = do let err =  show e
               hPutStr stderr err
               return ()
