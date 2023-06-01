-- Types.hs

module Types where

import Grammar
import Data.List (nub)

-- Type Environment
type TypeEnvironment = [(String, Type)]

-- Retrieves the type binding for a given variable
getBinding :: String -> TypeEnvironment -> Type
getBinding x [] = NoType
getBinding x ((y, t) : tenv)
  | x == y = t
  | otherwise = getBinding x tenv

-- Adds a type binding for a variable to the environment
addBinding :: String -> Type -> TypeEnvironment -> TypeEnvironment
addBinding x t tenv = (x, t) : tenv

-- Determines the type of an expression in the given type environment
typeOf :: TypeEnvironment -> Exp -> Type
typeOf tenv (TmInt _) = IntType -- Basic types
typeOf tenv (TmVar x) = getBinding x tenv
typeOf tenv (TmBool _) = BoolType
typeOf tenv (TmCellList _) = BaseType

-- Calculations
typeOf tenv (TmParen e) = typeOf tenv e
typeOf tenv (TmDiv e1 e2)
  | typeOf tenv e1 == IntType && typeOf tenv e2 == IntType = IntType
typeOf tenv (TmTimes e1 e2)
  | typeOf tenv e1 == IntType && typeOf tenv e2 == IntType = IntType
typeOf tenv (TmPlus e1 e2)
  | typeOf tenv e1 == IntType && typeOf tenv e2 == IntType = IntType
typeOf tenv (TmMinus e1 e2)
  | typeOf tenv e1 == IntType && typeOf tenv e2 == IntType = IntType

-- Getters
typeOf tenv (TmGetLength x)
  | getBinding x tenv == BaseType = IntType
typeOf tenv (TmGetWidth x)
  | getBinding x tenv == BaseType = IntType

-- Comparisons
typeOf tenv (TmComLT n1 n2)
  | typeOf tenv n1 == IntType && typeOf tenv n2 == IntType = BoolType
typeOf tenv (TmComGT n1 n2)
  | typeOf tenv n1 == IntType && typeOf tenv n2 == IntType = BoolType
typeOf tenv (TmComGTEQ n1 n2)
  | typeOf tenv n1 == IntType && typeOf tenv n2 == IntType = BoolType
typeOf tenv (TmComLTEQ n1 n2)
  | typeOf tenv n1 == IntType && typeOf tenv n2 == IntType = BoolType
typeOf tenv (TmComEQ e1 e2)
  | typeOf tenv e1 == typeOf tenv e2 = BoolType
typeOf tenv (TmComNOT e1 e2)
  | typeOf tenv e1 == typeOf tenv e2 = BoolType

-- Logical AND OR
typeOf tenv (TmAndOp e1 e2)
  | typeOf tenv e1 == BoolType && typeOf tenv e2 == BoolType = BoolType
typeOf tenv (TmOrOp e1 e2)
  | typeOf tenv e1 == BoolType && typeOf tenv e2 == BoolType = BoolType

-- Append
typeOf tenv (TmAppendH x1 x2)
  | getBinding x1 tenv == getBinding x2 tenv
    && getBinding x1 tenv == BaseType = BaseType
typeOf tenv (TmAppendV x1 x2)
  | getBinding x1 tenv == getBinding x2 tenv
    && getBinding x1 tenv == BaseType = BaseType

-- Object repeat
typeOf tenv (TmRepeatH x e)
  | getBinding x tenv == BaseType && typeOf tenv e == IntType = BaseType
typeOf tenv (TmRepeatV x e)
  | getBinding x tenv == BaseType && typeOf tenv e == IntType = BaseType

-- Rotate
typeOf tenv (TmRotateCW e x)
  | typeOf tenv e == IntType && getBinding x tenv == BaseType = BaseType
typeOf tenv (TmRotateACW e x)
  | typeOf tenv e == IntType && getBinding x tenv == BaseType = BaseType

-- Reflect
typeOf tenv (TmReflectCol x e)
  | getBinding x tenv == BaseType && typeOf tenv e == IntType = BaseType
typeOf tenv (TmReflectRow x e)
  | getBinding x tenv == BaseType && typeOf tenv e == IntType = BaseType

-- Scale
typeOf tenv (TmExpand x e)
  | getBinding x tenv == BaseType && typeOf tenv e == IntType = BaseType

-- Boolean operations on tiles/base objects
typeOf tenv (TmNeg x)
  | getBinding x tenv == BaseType = BaseType
typeOf tenv (TmAnd x1 x2)
  | getBinding x1 tenv == BaseType && getBinding x2 tenv == BaseType = BaseType
typeOf tenv (TmOr x1 x2)
  | getBinding x1 tenv == BaseType && getBinding x2 tenv == BaseType = BaseType

-- Subtile
typeOf tenv (TmTake e1 e2 e3 x)
  | (IntType, IntType, IntType) == (typeOf tenv e1, typeOf tenv e2, typeOf tenv e3)
      && getBinding x tenv == BaseType = BaseType

-- If-then-else
typeOf tenv (TmIfThenElse e1 e2 e3)
  | typeOf tenv e1 == BoolType && typeOf tenv e2 == typeOf tenv e3
      && typeOf tenv e2 /= NoType = typeOf tenv e2

-- If-then
typeOf tenv (TmIfThen e1 e2)
  | typeOf tenv e1 == BoolType = typeOf tenv e2

-- Iterations
typeOf tenv (TmIterRepeat n e)
  | typeOf tenv n == IntType = typeOf tenv e
typeOf tenv (TmIterWhile e1 e2)
  | typeOf tenv e1 == BoolType = typeOf tenv e2

-- Print
typeOf tenv (TmPrint x)
  | getBinding x tenv /= NoType = getBinding x tenv

-- Import (check later)
typeOf tenv (TmImport x1 x2)
  | getBinding x2 tenv == NoType = typeOf (addBinding x2 BaseType tenv) (TmVar x2)

-- Assign
typeOf tenv (TmAssign x e)
  | getBinding x tenv /= NoType
      && typeOf tenv e == getBinding x tenv = getBinding x tenv

-- TypeAssign
typeOf tenv (TmTypeAssign t x e)
  | t == typeOf tenv e = typeOf (addBinding x t tenv) (TmVar x)

-- Stmt && Stmts
typeOf tenv (TmStmt e) = typeOf tenv e
typeOf tenv (TmStmts e1 e2)
  | typeOf tenv e2 /= NoType = typeOf (getEnv tenv e2) e1
typeOf tenv _ = NoType

-- Return the type environment for a given expression
getEnv :: TypeEnvironment -> Exp -> TypeEnvironment
getEnv tenv (TmImport _ x) = addBinding x BaseType tenv
getEnv tenv (TmTypeAssign t x _) = addBinding x t tenv
getEnv tenv (TmStmts e1 e2) = getEnv (nub (getEnv tenv e2)) e1
getEnv tenv (TmStmt e) = getEnv tenv e
getEnv tenv _ = tenv

unparseType :: Type -> String
unparseType IntType = "Int"
unparseType BaseType = "Base"

checkType :: Exp -> String
checkType e
  | typeOf [] e == NoType = error "Type Error"
  | otherwise = "Type check passed"
