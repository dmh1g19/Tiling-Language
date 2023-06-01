{
module Grammar where
import Token
}

%name parseCalc 
%tokentype { Token } 
%error { parseError }

%token 
    Base    { TokenTypeBase _ }
    Int     { TokenTypeInt _ }
    Bool    { TokenTypeBool _ }
    cells   { TokenCells _ }
    import  { TokenImport _ }
    as      { TokenAs _ }
    width   { TokenWidth _ }
    length  { TokenLength _ }
    repeat  { TokenRepeat _ }
    while   { TokenWhile _ }
    end     { TokenEnd _ }
    if      { TokenIf _ }
    then    { TokenThen _ }
    else    { TokenElse _ }
    print   { TokenPrint _ }
    take    { TokenTake _ }
    size    { TokenSize _ }
    from    { TokenFrom _ }
    reflect { TokenReflect _ }
    on      { TokenOn _ }
    row     { TokenRow _ }
    col     { TokenCol _ }
    expand  { TokenExpand _ }
    by      { TokenBy _ }
    rotate  { TokenRotate _ }
    CW      { TokenDirCw _ }
    ACW     { TokenDirAcw _ }
    get     { TokenGet _ }
    neg     { TokenNeg _ }
    and     { TokenAnd _ }
    or      { TokenOr _ }
    file    { TokenFile _ }
    do      { TokenDo _ }
    '['     { TokenLBracket _ }
    ']'     { TokenRBracket _ }
    '{'     { TokenLCurBracket _ }
    '}'     { TokenRCurBracket _ }
    '|'     { TokenBar _ }
    '('     { TokenLParen _ }
    ')'     { TokenRParen _ }
    ';'     { TokenSem _ }
    ':'     { TokenColon _ }
    '-&'    { TokenAppHor _ }
    '+&'    { TokenAppVer _ }
    '&&'    { TokenAndOp _ }
    '||'    { TokenOrOp _ }
    '-*'    { TokenMulHor _ }
    '+*'    { TokenMulVer _ }
    '/'     { TokenDiv _ }
    '*'     { TokenMul _ }
    '+'     { TokenPlus _ }
    '-'     { TokenMinus _ }
    '='     { TokenAssign _ }
    '<'     { TokenLT _ }
    '>'     { TokenGT _ }
    '>='    { TokenGTE _ }
    '<='    { TokenLTE _ }    
    '=='    { TokenEQ _ }
    '!='    { TokenNEQ _ }
    '.'     { TokenDot _ }
    '0'     { TokenBlank _ }
    '1'     { TokenFilled _ }
    var     { TokenIdentifier _ $$ } 
    int     { TokenInteger _ $$ } 

%nonassoc '>' '<' '>=' '<=' '==' '!='
%left '&&' 
%left '||'
%left 'neg'
%left 'and'
%left 'or'
%left '-*' '+*' '-&' '+&' 
%left '+' '-'
%left '*' '/'

%%

stmts     : exp ';'                                         { TmStmt $1 }
          | stmts exp ';'                                   { TmStmts $2 $1 }

exp       : numExpr                                         { $1 } 
          | type var '=' exp                                { TmTypeAssign $1 $2 $4 }
          | var '=' exp                                     { TmAssign $1 $3 }
          | import var as var                               { TmImport $2 $4 }
          | print var                                       { TmPrint $2 }
          | repeat exp do stmts end                         { TmIterRepeat $2 $4 }
          | while exp do  stmts end                         { TmIterWhile $2 $4 }
          | if exp then '{' stmts '}' else '{' stmts '}'    { TmIfThenElse $2 $5 $9 }
          | if exp then '{' stmts '}'                       { TmIfThen $2 $5 }
          | cells ':' listCell                              { TmCellList $3 }
          | var '-&' var                                    { TmAppendH $1 $3 }
          | var '+&' var                                    { TmAppendV $1 $3 }
          | take exp exp size exp from var                  { TmTake $2 $3 $5 $7 }
          | rotate exp var CW                               { TmRotateCW $2 $3 }
          | rotate exp var ACW                              { TmRotateACW $2 $3 }
          | reflect var on row exp                          { TmReflectRow $2 $5 }
          | reflect var on col exp                          { TmReflectCol $2 $5 }
          | expand var by exp                               { TmExpand $2 $4 }
          | neg var                                         { TmNeg $2 }
          | and var var                                     { TmAnd $2 $3 } 
          | or var var                                      { TmOr $2 $3 }
          | var '-*' exp                                    { TmRepeatH $1 $3 }
          | var '+*' exp                                    { TmRepeatV $1 $3 }

numExpr   : numExpr '/' numExpr                             { TmDiv $1 $3 } 
          | numExpr '*' numExpr                             { TmTimes $1 $3 }
          | numExpr '+' numExpr                             { TmPlus $1 $3 }
          | numExpr '-' numExpr                             { TmMinus $1 $3 }
          | numExpr '&&' numExpr                            { TmAndOp $1 $3 }
          | numExpr '||' numExpr                            { TmOrOp $1 $3 }
          | numExpr '<' numExpr                             { TmComLT $1 $3 }
          | numExpr '>' numExpr                             { TmComGT $1 $3 }
          | numExpr '>=' numExpr                            { TmComGTEQ $1 $3 } 
          | numExpr '<=' numExpr                            { TmComLTEQ $1 $3 }
          | numExpr '==' numExpr                            { TmComEQ $1 $3 } 
          | numExpr '!=' numExpr                            { TmComNOT $1 $3 }
          | '(' numExpr ')'                                 { TmParen $2 }
          | get length var                                  { TmGetLength $3 }
          | get width var                                   { TmGetWidth $3 }
          | int                                             { TmInt $1 }
          | var                                             { TmVar $1 }
         
listCell : '[' cellList ']'                                 { $2 }
cellList : cellsl                                           { [$1] }
         | cellsl '|' cellList                              { $1 : $3 }
         | {- empty -}                                      { [] }
cellsl    : cell                                            { [$1] }
         | cell cellsl                                      { $1 : $2 }
cell     : '0'                                              { TmBlank }
         | '1'                                              { TmFilled }

type     : Int                                              { IntType }
         | Base                                             { BaseType }
{
parseError :: [Token] -> a
parseError [] = error "Unknown Parse Error." 
parseError (t:ts) = error ("Parse error at line:column " ++ (tokenPosn t) ++ "\n")

data Type = IntType
          | BaseType
          | BoolType
          | NoType
  deriving (Show, Eq, Ord)

data Exp = TmDiv Exp Exp
             | TmTimes Exp Exp
             | TmPlus Exp Exp
             | TmMinus Exp Exp
             | TmParen Exp
             | TmGetLength String
             | TmGetWidth String
             | TmInt Int
             | TmAndOp Exp Exp
             | TmOrOp Exp Exp
             | TmComLT Exp Exp
             | TmComGT Exp Exp
             | TmComGTEQ Exp Exp
             | TmComLTEQ Exp Exp
             | TmComEQ Exp Exp
             | TmTypeAssign Type String Exp 
             | TmAssign String Exp
             | TmImport String String
             | TmPrint String
             | TmIterRepeat Exp Exp
             | TmIterWhile Exp Exp
             | TmIfThenElse Exp Exp Exp
             | TmIfThen Exp Exp
             | TmCellList [[Exp]]
             | TmAppendH String String
             | TmAppendV String String
             | TmVar String
             | TmBool Bool
             | TmFilled
             | TmBlank
             | TmTake Exp Exp Exp String
             | TmReflectRow String Exp 
             | TmReflectCol String Exp 
             | TmExpand String Exp
             | TmNeg String
             | TmAnd String String
             | TmOr String String
             | TmRepeatH String Exp
             | TmRepeatV String Exp
             | TmRotateCW Exp String 
             | TmRotateACW Exp String
             | TmComNOT Exp Exp
             | TmStmt Exp
             | TmStmts Exp Exp
  deriving (Show, Eq, Ord)
}
