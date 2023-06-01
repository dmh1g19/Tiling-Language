module Eval where
import Grammar
import HelperFunctions
import Data.Char

type Environment = [(String, Exp)]
type Kontinuation = [Frame]
type State = (Exp, Environment, Kontinuation)

data Frame = HDiv Exp Environment       | DivH Exp
            | HTimes Exp Environment    | TimesH Exp   
            | HPlus Exp Environment     | PlusH Exp  
            | HMinus Exp Environment    | MinusH Exp 

            | HComLT Exp Environment    | ComLTH Exp
            | HComGT Exp Environment    | ComGTH Exp 
            | HComGTEQ Exp Environment  | ComGTEQH Exp 
            | HComLTEQ Exp Environment  | ComLTEQH Exp 
            | HComEQ Exp Environment    | ComEQH Exp 
            | HComNOT Exp Environment   | ComNOTH Exp

            | HAndOp Exp Environment    | AndOpH Exp
            | HOrOp Exp Environment     | OrOpH Exp
            
            | HTypeAssign Type String Environment
            | HAssign String Environment
            
            | HRotateCW String Environment
            | HRotateACW String Environment

            | HRepeatH String Environment
            | HRepeatV String Environment

            | HReflectRow String Environment
            | HReflectCol String Environment

            | Take1 Exp Exp String Environment | Take2 Exp Exp String Environment 
            | Take3 Exp Exp String Environment 

            | HExpand String Environment

            | HIterRepeat1 Exp Environment
            | HIterRepeat2 Exp Int Environment
            | HIterWhile Exp Exp Environment

            | HIfThen Exp Environment
            | HIfThenElse Exp Exp Environment

            | HStmts Exp Environment
            | HStmt
            deriving (Show, Eq, Ord)

update :: Environment -> String -> Exp -> Environment
update env x e = (x,e) : env

getter :: String -> Environment -> Exp
getter x [] = error "Variable binding not found"
getter x ((y,e):env) | x == y = e
                     | otherwise = getter x env

mergeEnv :: Environment -> Environment -> Environment
mergeEnv env1 env2 = env1 ++ [x | x <- env2, x `notElem` env1]

eval1 :: State -> IO State
-- Variables and statements
eval1 (TmVar x, env, k) = return (e', env, k) where e' = getter x env
eval1 (TmStmts e1 e2, env, k) = return (e2, env, (HStmts e1 env) : k)
eval1 (TmStmt e, env, k) = return (e, env, k)

-- Import function
eval1 (TmImport fileName varName, env, k) = getFromFile fileName >>= \content -> return (TmAssign varName (TmCellList content), env, k)

-- Assignments without explicit type declarations
eval1 (TmAssign x e, env, k) = return (e, env, (HAssign x env) : k)
eval1 (TmInt n, env1, (HAssign x env2) : k) = return (TmVar x, update env2 x (TmInt n), k)
eval1 (TmCellList l, env1, (HAssign x env2) : k) = return (TmVar x, update env2 x (TmCellList l), k)

-- Assignments with type declarations
eval1 (TmTypeAssign t x e, env, k) = return (e, env, (HTypeAssign t x env) : k)
eval1 (TmInt n, env1, (HTypeAssign t x env2) : k) = return (TmVar x, update env2 x (TmInt n), k)
eval1 (TmCellList l, env1, (HTypeAssign t x env2) : k) = return (TmVar x, update env2 x (TmCellList l), k)

-- Rotate functions
eval1 (TmRotateCW e x, env, k) = return (e, env, (HRotateCW x env) : k)
eval1 (TmInt n, env1, (HRotateCW x env2) : k) | rotateChecker n = return (TmVar x, update env2 x rotatedTile, k) | otherwise = error "Tile Rotate Error"
    where 
      rotatedTile = convertToCellList (rotateCW (convertToTileList $ getter x env2) n)

eval1 (TmRotateACW e x, env, k) = return (e, env, (HRotateACW x env) : k)
eval1 (TmInt n, env1, (HRotateACW x env2) : k) | rotateChecker n = return (TmVar x, update env2 x rotatedTile, k) | otherwise = error "Tile Rotate Error"
    where 
      rotatedTile = convertToCellList (rotateACW (convertToTileList $ getter x env2) n)

-- Reflect functions
eval1 (TmReflectRow x e, env, k) = return (e, env, (HReflectRow x env) : k)
eval1 (TmInt n, env1, (HReflectRow x env2) : k) | reflectChecker n tL = return (TmVar x, update env2 x reflectedTile, k) | otherwise = error "Tile Reflect Error"
    where 
      tL = getLength (convertToTileList $ getter x env2)
      reflectedTile = convertToCellList (reflectR (convertToTileList $ getter x env2) n)

eval1 (TmReflectCol x e, env, k) = return (e, env, (HReflectCol x env) : k)
eval1 (TmInt n, env1, (HReflectCol x env2) : k) | reflectChecker n tW = return (TmVar x, update env2 x reflectedTile, k) | otherwise = error "Tile Reflect Error"
    where 
      tW = getWidth (convertToTileList $ getter x env2)
      reflectedTile = convertToCellList (reflectC (convertToTileList $ getter x env2) n)

-- Append functions
eval1 (TmAppendH x1 x2, env, k) | appendChecker tW1 tW2 = return (TmCellList x1Appx2, env, k) | otherwise = error "Tile Append Error"
    where 
      tW1 = getWidth (convertToTileList $ getter x1 env)
      tW2 = getWidth (convertToTileList $ getter x2 env)
      x1Appx2 = appendH (convertToTileList $ getter x1 env) (convertToTileList $ getter x2 env)

eval1 (TmAppendV x1 x2, env, k) | appendChecker tL1 tL2 = return (TmCellList x1Appx2, env, k) | otherwise = error "Tile Append Error"
    where 
      tL1 = getLength (convertToTileList $ getter x1 env)
      tL2 = getLength (convertToTileList $ getter x2 env)
      x1Appx2 = appendV (convertToTileList $ getter x1 env) (convertToTileList $ getter x2 env)

-- Repeat tile functions
eval1 (TmRepeatH x e, env, k) = return (e, env, (HRepeatH x env) : k)
eval1 (TmInt n, env1, (HRepeatH x env2) : k) = return (TmVar x, update env2 x newTile, k)
    where 
      newTile = convertToCellList (tileRepeatH (convertToTileList $ getter x env2) n)

eval1 (TmRepeatV x e, env, k) = return (e, env, (HRepeatV x env) : k)
eval1 (TmInt n, env1, (HRepeatV x env2) : k) = return (TmVar x, update env2 x newTile, k)
    where 
      newTile = convertToCellList (tileRepeatV (convertToTileList $ getter x env2) n)

-- Neg, And and Or operation functions
eval1 (TmNeg x, env, k) = return (TmVar x, update env x negatedTile, k)
    where 
      negatedTile = convertToCellList (tileNeg $ convertToTileList $ getter x env)

eval1 (TmAnd x1 x2, env, k) | tileBoolOpChecker t1 t2 = return (TmCellList x1Andx2, env, k) | otherwise = error "Tile And Operation Failed"
    where 
      t1 = convertToTileList $ getter x1 env
      t2 = convertToTileList $ getter x2 env
      x1Andx2 = tileAnd  t1 t2

eval1 (TmOr x1 x2, env, k) | tileBoolOpChecker t1 t2 = return (TmCellList x1Orx2, env, k) | otherwise = error "Tile Or Operation Failed"
    where 
      t1 = convertToTileList $ getter x1 env
      t2 = convertToTileList $ getter x2 env
      x1Orx2 = tileOr t1 t2

-- Expand function
eval1 (TmExpand x e, env, k) = return (e, env, (HExpand x env) : k)
eval1 (TmInt n, env1, (HExpand x env2) : k) = return (TmVar x, update env2 x expandedTile, k)
    where 
      expandedTile = convertToCellList (expand (convertToTileList $ getter x env2) n)

-- Functions for getting the length and width of a tile
eval1 (TmGetLength x, env, k) = return (TmInt (getLength (convertToTileList (getter x env))), env, k)
eval1 (TmGetWidth  x, env, k) = return (TmInt (getLength (convertToTileList (getter x env))), env, k)

-- Function for generating subtiles
eval1 (TmTake n1 n2 n3 x, env, k) = return (n1, env, (Take1 n2 n3 x env) : k)
eval1 (TmInt n1, env1, (Take1 n2 n3 x env2) : k) = return (n2, env2, (Take2 (TmInt n1) n3 x env2) : k)
eval1 (TmInt n2, env1, (Take2 n1 n3 x env2) : k) = return (n3, env2, (Take3 n1 (TmInt n2) x env2) : k)
eval1 (TmInt n3, env1, (Take3 (TmInt n1) (TmInt n2) x env2) : k) | subtileChecker n1 n2 n3 l w = return (TmCellList newTile, env2, k) | otherwise = error "Subtile Error"
    where 
      l = getLength (convertToTileList $ getter x env2)
      w = getWidth (convertToTileList $ getter x env2)
      newTile = subtile (convertToTileList $ getter x env2) n1 n2 n3

-- Arithmetic
eval1 (TmPlus e1 e2, env, k) = return (e1, env, (HPlus e2 env) : k)
eval1 (TmInt n, env1, (HPlus e env2) : k) = return (e, env2, (PlusH (TmInt n)) : k)
eval1 (TmInt m, env, (PlusH (TmInt n)):k) = return (TmInt (n + m), env, k)

eval1 (TmMinus e1 e2, env, k) = return (e1, env, (HMinus e2 env) : k)
eval1 (TmInt n, env1, (HMinus e env2) : k) = return (e, env2, (MinusH (TmInt n)) : k)
eval1 (TmInt m, env, (MinusH (TmInt n)):k) = return (TmInt (n - m), env, k)

eval1 (TmTimes e1 e2, env, k) = return (e1, env, (HTimes e2 env) : k)
eval1 (TmInt n, env1, (HTimes e env2) : k) = return (e, env2, (TimesH (TmInt n)) : k)
eval1 (TmInt m, env, (TimesH (TmInt n)):k) = return (TmInt (n * m), env, k)

eval1 (TmDiv e1 e2, env, k) = return (e1, env, (HDiv e2 env) : k)
eval1 (TmInt n, env1, (HDiv e env2) : k) = return (e, env2, (DivH (TmInt n)) : k)
eval1 (TmInt m, env, (DivH (TmInt n)):k) = return (TmInt (n `div` m), env, k)

-- Logic
eval1 (TmComLT e1 e2, env, k) = return (e1, env, (HComLT e2 env) : k)
eval1 (TmInt n, env1, (HComLT e env2) : k) = return (e, env2, (ComLTH (TmInt n)) : k)
eval1 (TmInt m, env, (ComLTH (TmInt n)) : k) = return (TmBool (n < m), env, k)

eval1 (TmComGT e1 e2, env, k) = return (e1, env, (HComGT e2 env) : k)
eval1 (TmInt n, env1, (HComGT e env2) : k) = return (e, env2, (ComGTH (TmInt n)) : k)
eval1 (TmInt m, env, (ComGTH (TmInt n)) : k) = return (TmBool (n > m), env, k)

eval1 (TmComGTEQ e1 e2, env, k) = return (e1, env, (HComGTEQ e2 env) : k)
eval1 (TmInt n, env1, (HComGTEQ e env2) : k) = return (e, env2, (ComGTEQH (TmInt n)) : k)
eval1 (TmInt m, env, (ComGTEQH (TmInt n)) : k) = return (TmBool (n >= m), env, k)

eval1 (TmComLTEQ e1 e2, env, k) = return (e1, env, (HComLTEQ e2 env) : k)
eval1 (TmInt n, env1, (HComLTEQ e env2) : k) = return (e, env2, (ComLTEQH (TmInt n)) : k)
eval1 (TmInt m, env, (ComLTEQH (TmInt n)) : k) = return (TmBool (n <= m), env, k)

eval1 (TmComEQ e1 e2, env, k) = return (e1, env, (HComEQ e2 env) : k)
eval1 (TmInt n, env1, (HComEQ e env2) : k) = return (e, env2, (ComEQH (TmInt n)) : k)
eval1 (TmInt m, env, (ComEQH (TmInt n)) : k) = return (TmBool (n == m), env, k)

eval1 (TmComNOT e1 e2, env, k) = return (e1, env, (HComNOT e2 env) : k)
eval1 (TmInt n, env1, (HComNOT e env2) : k) = return (e, env2, (ComNOTH (TmInt n)) : k)
eval1 (TmInt m, env, (ComNOTH (TmInt n)) : k) = return (TmBool (n /= m), env, k)

eval1 (TmAndOp e1 e2, env, k) = return (e1, env, (HAndOp e2 env) : k)
eval1 (TmBool b, env1, (HAndOp e2 env2) : k) = return (e2, env2, (AndOpH (TmBool b)) : k)
eval1 (TmBool b1, env, (AndOpH (TmBool b2) : k)) = return (TmBool (b1 && b2), env, k)

eval1 (TmOrOp e1 e2, env, k) = return (e1, env, (HOrOp e2 env) : k)
eval1 (TmBool b, env1, (HOrOp e2 env2) : k) = return (e2, env2, (OrOpH (TmBool b)) : k)
eval1 (TmBool b1, env, (OrOpH (TmBool b2) : k)) = return (TmBool (b1 || b2), env, k)

-- If-then
eval1 (TmIfThen e1 e2, env, k) = return (e1, env, (HIfThen e2 env):k)
eval1 (TmBool True, env1, (HIfThen e2 env2): k) = return (e2, env2, k)
eval1 (TmBool False, env1, (HIfThen e2 env2): k) = return (TmBool False, env2, k)

--if-then-else
eval1 (TmIfThenElse e1 e2 e3, env, k) = return (e1, env, (HIfThenElse e2 e3 env):k)
eval1 (TmBool True, env1, (HIfThenElse e2 e3 env2): k) = return (e2, env2, k)
eval1 (TmBool False, env1, (HIfThenElse e2 e3 env2): k) = return (e3, env2, k)

-- Loops
eval1 (TmIterRepeat n e, env, k) = return (n, env, (HIterRepeat1 e env) : k)
eval1 (TmInt n, env1, (HIterRepeat1 e env2) : k) = return (e, env2, (HIterRepeat2 e n env2) : k)

eval1 (e1, env1, (HIterRepeat2 e2 n env2) : k) | n == 2 = return (e2, env1, k)
eval1 (e1, env1, (HIterRepeat2 e2 n env2) : k) | isValue e1 = return (e2, env1, (HIterRepeat2 e2 (n-1) env1) : k)

eval1 (TmIterWhile b e, env, k) = return (b, env, (HIterWhile b e env) : k)
eval1 (TmBool True, env1, (HIterWhile b e env2) : k) = return (e, env2, (HIterWhile b e env2) : k)
eval1 (TmBool False, env1, (HIterWhile b e env2) : k) = return (TmBool False, env1, k)
eval1 (e1, env1, (HIterWhile b e2 env2) : k) | isValue e1 = return (TmIterWhile b e2, env1, k)

eval1 (TmParen e, env, k) = return (e, env, k)

-- Print function
eval1 (TmPrint x, env, k) = do
    let result = getter x env
    mapM_ (putStrLn .concatMap show) (convertToInt result)
    return (TmBool True, env, k)

eval1 (e1, env1, (HStmts e2 env2) : k) = return (e2, mergeEnv env1 env2, k)
eval1 (e, env, []) = return (e, env, [])

halt :: State -> State -> Bool
halt (e1, env1, k1) (e2, env2, k2) = if  (e1 == e2) && (isValue e1) && (null k1) then True else False
