module Types where
import Grammar

type TypeEnvironment = [ (String,Type) ]

--runCheck s e@(TmStmt (TmPrint x)) = typeOfAssignDef s e

getBinding x [] = error "Variable binding not found"
getBinding x ((y,t):tenv) | x == y  = t
                        | otherwise = getBinding x tenv

addBinding x t tenv = (x,t):tenv

typeOfNum _ (TmInt _) = IntType
typeOfNum tenv (TmVar n) | getBinding n tenv == IntType = IntType
typeOfNum tenv (TmParen e1) = typeOfNum tenv e1
typeOfNum tenv (TmDiv e1 e2) | (IntType,IntType) == (typeOfNum tenv e1, typeOfNum tenv e2) = IntType
typeOfNum tenv (TmTimes e1 e2) | (IntType,IntType) == (typeOfNum tenv e1, typeOfNum tenv e2) = IntType
typeOfNum tenv (TmPlus e1 e2) | (IntType,IntType) == (typeOfNum tenv e1, typeOfNum tenv e2) = IntType
typeOfNum tenv (TmMinus e1 e2) | (IntType,IntType) == (typeOfNum tenv e1, typeOfNum tenv e2) = IntType
typeOfNum tenv (TmGetter side x) | (side == TmLength || side == TmWidth) && (getBinding x tenv == TileType || getBinding x tenv == BaseType) = IntType
typeOfNum tenv _ = erro "Type error"

typeOfAppend tenv (TmAppH x app) | getBinding x tenv == TileType || getBinding x tenv == BaseType = typeOfAppend tenv app
typeOfAppend tenv (TmAppV x app) | getBinding x tenv == TileType || getBinding x tenv == BaseType = typeOfAppend tenv app
typeOfAppend tenv (TmAppH2 x) | getBinding x tenv == TileType || getBinding x tenv == BaseType = BaseType
typeOfAppend tenv (TmAppV2 x) | getBinding x tenv == TileType || getBinding x tenv == BaseType = BaseType
typeOfAppend tenv _ = error "Type error"

typeOfOperation tenv (TmRotate n x dir) | (dir == TmCW || dir == TmACW) && (typeOfNum tenv n == IntType) 
                                            && ((getBinding x tenv == TileType) || (getBinding x tenv == BaseType)) = getBinding x tenv
typeOfOperation tenv (TmReflect x dir n) | (dir == TmRow || dir == TmCol) && (typeOfNum tenv n == IntType)
                                            && ((getBinding x tenv == TileType) || (getBinding x tenv == BaseType)) = getBinding x tenv
typeOfOperation tenv (TmScale op x n) | (op == TmExpand || op == TmShrink) && (typeOfNum tenv n == IntType)
                                            && (getBinding x tenv == TileType || getBinding x tenv == BaseType) = getBinding x tenv
typeOfOperation tenv (TmNeg x) | (getBinding x tenv == TileType) || (getBinding x tenv == BaseType) = getBinding x tenv
typeOfOperation tenv (TmAnd x1 x2) | (getBinding x1 tenv == getBinding x2 tenv) 
                                        && (getBinding x1 tenv == TileType || getBinding x1 tenv == BaseType) = getBinding x1 tenv
typeOfOperation tenv (TmOr x1 x2) | (getBinding x1 tenv == getBinding x2 tenv) 
                                        && (getBinding x1 tenv == TileType || getBinding x1 tenv == BaseType) = getBinding x1 tenv
typeOfOperation tenv (TmTake n1 n2 n3 x) | (IntType, IntType, IntType) == (typeOfNum tenv n1 , typeOfNum tenv n2 , typeOfNum tenv n3)
                                            && (getBinding x tenv == TileType || getBinding x tenv == BaseType) = TileType
typeOfOperation tenv (TmRepeatH x n) | (getBinding x tenv == TileType || getBinding x tenv == BaseType) && typeOfNum tenv n == IntType = BaseType
typeOfOperation tenv (TmRepeatV x n) | (getBinding x tenv == TileType || getBinding x tenv == BaseType) && typeOfNum tenv n == IntType = BaseType
typeOfOperation tenv (TmAppend x app) | (getBinding x tenv == TileType || getBinding x tenv == BaseType) && typeOfAppend tenv app == BaseType = BaseType
typeOfOperation tenv _ = error "Type error"

typeOfCompare c | c == TmComLT || c == TmComGT || c == TmComGTEQ
                  || c == TmComLTEQ || c == TmComEQ || c == TmComNOT = BoolType
typeOfCompare _ = error "Type error"

typeOfLogicCom lop | lop == TmAndOp || lop == TmOrOp = BoolType
typeOfLogicCom _ = error "Type error"

typeOfLogic _ (TmLogicBool b) | b == TmTrue || b == TmFalse = BoolType
typeOfLogic tenv (TmLogicVar x) | getBinding x tenv == BoolType = BoolType
typeOfLogic tenv (TmLogicParen e1) = typeOfLogic tenv e1
typeOfLogic tenv (TmLogicComNum n1 c n2) | (IntType, BoolType, IntType) == (typeOfNum tenv n1, typeOfCompare c, typeOfNum tenv n2) = BoolType
typeOfLogic tenv (TmLogicCompare e1 lop e2) | (BoolType, BaseType, BaseType) == (typeOfLogic tenv e1, typeOfLogicCom lop, typeOfLogic tenv e2) = BoolType
typeOfLogic tenv _ = error "Type error"

typeOfList (TmCellList _) = TileType
typeOfList (TmTileList _) = BaseType
typeOfList _ = error "Type error"

typeOfAssign tenv (TmIntAssign x n) | (IntType, IntType) == (getBinding x tenv, typeOfNum tenv n) = IntType
typeOfAssign _ (TmBoolAssign b) | b == TmTrue || b == TmFalse = BoolType
typeOfAssign tenv (TmVarAssign x1 x2) | getBinding x1 tenv == error  "Variable binding not found" = getBinding x2 tenv
                                      | getBinding x2 tenv == error "Variable binding not found" = error "Type error"
                                      | getBinding x1 tenv == getBinding x2 tenv = getBinding x1 tenv
typeOfAssign tenv (TmListAssign x l) | getBinding x tenv == error  "Variable binding not found" = typeOfList l
                                     | getBinding x tenv == typeOfList l = getBinding x tenv
typeOfAssign tenv (TmOpAssign x op) | getBinding x tenv == error  "Variable binding not found" = typeOfOperation tenv op
                                    | getBinding x tenv == typeOfOperation tenv op = getBinding x tenv
typeOfAssign tenv _ = error "Type error"

typeOfAssignDef tenv (TmTypeAssign t (TmIntAssign x n)) | getBinding x tenv == error  "Variable binding not found" 
                                                            && t == typeOfAssign tenv (TmIntAssign x n) = getBinding x (addBinding x t tenv) 
typeOfAssignDef tenv (TmTypeAssign t (TmBoolAssign b)) | t == typeOfAssign tenv (TmBoolAssign b) = BoolType
typeOfAssignDef tenv (TmTypeAssign t (TmVarAssign x1 x2)) | getBinding x1 tenv == error  "Variable binding not found"
                                                            && t == typeOfAssign tenv (TmVarAssign x1 x2) = getBinding x1 (addBinding x1 t tenv) 
typeOfAssignDef tenv (TmTypeAssign t (TmListAssign x e)) | getBinding x tenv == error  "Variable binding not found" 
                                                            && t == typeOfAssign tenv (TmListAssign x e) = getBinding x (addBinding x t tenv)                                                         
typeOfAssignDef tenv (TmTypeAssign t (TmOpAssign x op)) | getBinding x tenv == error  "Variable binding not found" 
                                                            && t == typeOfAssign tenv (TmOpAssign x op) = getBinding x (addBinding x t tenv) 
typeOfAssignDef tenv (TmAssign a) = typeOfAssign tenv a
--typeOfAssignDef tenv (TmImport f x) = ????
typeOfAssignDef tenv (TmPrint x) | getBinding x tenv /= error "Variable binding not found" = getBinding x tenv
typeOfAssignDef tenv (TmIterRepeat n s) | typeOfNum tenv n == IntType = typeOfStmts tenv s
typeOfAssignDef tenv (TmIfThenElse l s1 s2) | typeOfLogic tenv l == BoolType && typeOfStmts tenv s1 == typeOfStmts tenv s2 = typeOfStmts tenv s1
typeOfAssignDef tenv (TmIfThen l s) | typeOfLogic tenv l == BoolType = typeOfStmts tenv s
typeOfAssignDef tenv _ = error "Type error"


typeOfStmts tenv (TmStmts a s) | typeOfAssignDef tenv a /= error "Type error" = typeOfStmts tenv s
typeOfStmts tenv (TmStmt a) = typeOfAssignDef tenv a
typeOfStmts tenv _ = error "Type error"
