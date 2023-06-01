module Eval where

import Token
import Grammar
import HelperFunctions
import System.Environment

type Kontinuation = [Frame]
type State = (Exp, Environment, Kontinuation)
type Environment = [ (String,Exp) ]

data Frame = HImport String Environment | ImportH String
         | HPlus Exp Environment | PlusH Exp | ContH Exp Environment
         deriving Show

getValueBinding :: String -> Environment -> (Exp,Environment)
getValueBinding x [] = error "Variable binding not found"
getValueBinding x ((y,e):env) | x == y  = (e,(x,e):env)
                              | otherwise = getValueBinding x env

update :: Environment -> String -> Exp -> Environment
update [] x e = [(x,e)]
update ((y,e1):env) x e2 | x == y  = ((y,e2):env)
                       | otherwise = (y,e1):update env x e2

isValue :: Exp -> Bool
isValue (TmInt _) = True
isValue TmTrue = True
isValue TmFalse = True
isValue TmFilled = True
isValue TmBlank = True
isValue (TmCellList _) = True
isValue _ = False

-- Small step evaluation function
eval1 :: State -> IO State

eval1 ((TmVar x),env,k) = return (e',env',k) 
  where (e',env') = getValueBinding x env

-- terminated evaluations
eval1 (v, env, []) | isValue v = return (v, env, [])

-- arithmetic operations
eval1 (TmPlus e1 e2, env, k) = return (e1, env, (HPlus e2 env) : k)
eval1 (TmInt n, env1, (HPlus e env2) : k) = return (e, env2, (PlusH (TmInt n)) : k)
eval1 ((TmInt m),env,(PlusH (TmInt n)):k) = return (TmInt (n + m),[],k)

-- Import 
eval1 (TmImport fileName varName, env, k) = getFromFile fileName >>= \content -> return (TmCellList content, env, k)

-- TmCont
eval ((TmCont e1 e2), env, k) = return (e1, env, (ContH e2 env) : k)
eval (n, env, (ContH e env') : k) = return (e, env', k)

-- TmTypeAssign TODO: Continue implmenting the TmTypeAssign 
eval1 (TmTypeAssign t x e, env, k) = return (e, env, (HTypeAssign t x env) : k)
eval1 (TmInt n, env1, (HTypeAssign t x env2) : k) = return (TmVar x, update env2 x (TmInt n), k)
eval1 (TmCellList l, env1, (HTypeAssign t x env2) : k) = return (TmVar x, update env2 x (TmCellList l), k)

evalLoop :: Exp -> IO Exp
evalLoop e = evalLoop' (e,[],[])
  where evalLoop' (e,env,k) = do
          (e',env',k') <- eval1 (e,env,k)
          if (e' == e) && (isValue e') && (null k') then return e'
          else evalLoop' (e',env',k')
