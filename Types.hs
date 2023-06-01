module Types where
import Grammar
import Control.Monad.Error

type TypeEnv = [(String,Type)]

lookup1 :: String -> TypeEnv -> Maybe Type
lookup1 x [] = Nothing
lookup1 x env | x == (fst (head env)) =  Just (snd (head env))
              | otherwise = lookup1 x (tail env)

addBinding :: String -> Type -> TypeEnv -> TypeEnv
addBinding x typ [] = [(x,typ)]
addBinding x typ ((y,e):env) | x == y = (y,e):env
                             | otherwise = (y,e):(addBinding x typ env)

data TypeError = TypeMismatch Type Type | NotFound  deriving Eq

instance Error TypeError where
    noMsg = NotFound
     

instance Show TypeError where
    show (TypeMismatch a b) = "Type Mismatch: " ++ show a ++ " is not " ++ show b
    show (NotFound) = "Variable not found in type environment"

typeof :: (Exp,TypeEnv) -> Either TypeError Type
typeof (expr,env) = case expr of 
    TmInt x -> return IntType
    
    TmTrue -> return BoolType
    
    TmFalse -> return BoolType
    
    TmCellList x -> return CellListType
    
    TmVar x -> do
        let type1 = lookup1 x env
        if (type1 == Just IntType)
        then return IntType
        else 
            if (type1 == Just BoolType)
            then return BoolType
            else 
                if (type1 == Just CellListType)
                then return CellListType
                else throwError $ NotFound

    TmCont (TmTypeAssign t x e) e2 -> do 
        te2 <- typeof(e2, addBinding x t env) 
        return te2 

    TmCont e1 e2 -> do 
        te1 <- typeof (e1,env)
        te2 <- typeof (e2,getEnv (e1,env))
        return te2
    
    TmTypeAssign t x e -> do
        return t

    -- Import statement not type checked
    -- probably needs to be checked during run time
    TmImport x1 x2 -> do
      return CellListType

    TmIterRepeat e1 e2 -> do
        te1 <- typeof (e1,env)
        te2 <- typeof (e2,env)
        if (te1 /= IntType)
        then throwError $ TypeMismatch te1 IntType
        else return te2

    TmAppendH x e -> do
        let te1 = lookup x env
        if te1 /= Just CellListType
        then throwError $ NotFound
        else return CellListType
    
    TmAppendV x e -> do
        let te1 = lookup x env
        if te1 /= Just CellListType
        then throwError $ NotFound
        else return CellListType

    TmRepeatH x n -> do
        let te1 = lookup x env
        if (te1 /= Just CellListType)
        then throwError $ NotFound
        else return CellListType
    
    TmRepeatV x n -> do
        let te1 = lookup x env
        if (te1 /= Just CellListType)
        then throwError $ NotFound
        else return CellListType

    TmPlus e1 e2 -> do
        te1 <- typeof (e1,env)
        te2 <- typeof (e2,env)
        if (te1) /= IntType
        then throwError $ TypeMismatch te1 IntType
        else
            if te2 /= IntType
            then throwError $ TypeMismatch te2 IntType
            else return IntType
      
getEnv :: (Exp,TypeEnv) -> TypeEnv
getEnv ((TmTypeAssign t x e),env) = (addBinding x t env)
getEnv ((TmCont (TmTypeAssign t x e) e2),env) = getEnv (e2,(addBinding x t env))
getEnv ((TmCont e1 e2),env) = getEnv (e2,getEnv(e1,env))
getEnv (_,env) = env

result :: Either TypeError Type -> String
result (Left e) = show e
result (Right e) = show e
--result (Right e) = "No type error was found"

