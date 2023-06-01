{
module Grammar where
import Token
}

%name parseCalc 
%tokentype { Token } 
%error { parseError }

%token 
    Tile    { TokenTypeTile _ }
    Base    { TokenTypeBase _ }
    Int     { TokenTypeInt _ }
    Bool    { TokenTypeBool _ }
    TileList{ TokenTileListType _ }
    CellList{ TokenCellListType _ }
    cells   { TokenCells _ }
    tiles   { TokenTiles _ }
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
    shrink  { TokenShrink _ }
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
    ','     { TokenComma _ }
    '0'     { TokenBlank _ }
    '1'     { TokenFilled _ }
    True    { TokenTrue _ }
    False   { TokenFalse _ }
    var     { TokenIdentifier _ $$ } 
    int     { TokenInteger _ $$ } 

%nonassoc if
%nonassoc then
%nonassoc else
%nonassoc int True False var '(' ')'
%nonassoc while
%nonassoc size
%left '-&' '+&'
%left '-*' '+*'
%left ';'
%left '<'
%left '>'
%left '<='
%left '=<'
%left '!='
%left '+'
%left '*'
%left '-'
%left '/'
%left ','
%left '.'
%right '='
%right '=='
%right '['
%right '{'

%%

exp : int                                              { TmInt $1 } 
    | var                                              { TmVar $1 }
    | True                                             { TmTrue }
    | False                                            { TmFalse }
    | exp '<' exp                                      { TmComLT $1 $3 }
    | exp '==' exp                                     { TmComEQ $1 $3 }
    | type var '=' exp                                 { TmTypeAssign $1 $2 $4 }
    | exp '+' exp                                      { TmPlus $1 $3 }
    | exp '*' exp                                      { TmTimes $1 $3 }
    | exp '-' exp                                      { TmMinus $1 $3 }
    | exp '/' exp                                      { TmDiv $1 $3 }
    | take '(' exp ',' exp ')' size exp from var       { TmTake $3 $5 $8 $10 }
    | if exp then '{' exp '}' else '{' exp '}'         { TmIfThenElse $2 $5 $9 }
    | if exp then '{' exp '}'                          { TmIfThen $2 $5 }
    | exp ';' exp                                      { TmCont $1 $3 }
    | '(' exp ')'                                      { $2 }
    | repeat exp do exp end                            { TmIterRepeat $2 $4 }
    | while '(' exp ')' do exp end                     { TmIterWhile $3 $6 }
    | cells ':' listCell                               { TmCellList $3 }
    | tiles ':' listTile                               { TmTileList $3 }
    | get length var                                   { TmGetLength $3 }
    | get width var                                    { TmGetWidth $3 }
    | expand var by exp                                { TmExpand $2 $4 }
    | shrink var by exp                                { TmShrink $2 $4 }
    | rotate '(' exp ')' var CW                        { TmRotateCW $3 $5 }
    | rotate '(' exp ')' var ACW                       { TmRotateACW $3 $5 }
    | reflect var on row exp                           { TmReflectRow $2 $5 }
    | reflect var on col exp                           { TmReflectCol $2 $5 }
    | import var as var { TmImport $2 $4 }
    | var '-&' var                                    { TmAppendH $1 $3 }
    | var '+&' var                                    { TmAppendV $1 $3 }
    | var '-*' int                                   { TmRepeatH $1 $3 }
    | var '+*' int                                   { TmRepeatV $1 $3 }
    | neg var                                         { TmNeg $2 }
    | and var var                                     { TmAnd $2 $3 } 
    | or var var                                      { TmOr $2 $3 }

listCell : '[' cellList ']'                           { $2 }
cellList : cellsl                                     { [$1] }
         | cellsl '|' cellList                        { $1 : $3 }
         | {- empty -}                                { [] }
cellsl   : int                                      { [$1] }
         | int ',' cellsl                                { $1 : $3 }

listTile : '[' tileList ']'                           { $2 }
tileList : tile                                       { [$1] }
         | tile '|' tileList                          { $1 : $3 }
         | {- empty -}                                { [] }
tile     : var                                        { $1 }

type     : Int                                        { IntType }
         | Tile                                       { TileType }
         | Base                                       { BaseType }
         | Bool                                       { BoolType }
         | CellList                                   { CellListType }
         | TileList                                   { TileListType }
{
parseError :: [Token] -> a
parseError [] = error "Unknown Parse Error." 
parseError (t:ts) = error ("Parse error at line:column " ++ (tokenPosn t) ++ "\n")

data Type = IntType
          | TileType 
          | BaseType 
          | BoolType
          | CellListType
          | TileListType
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
             | TmExp Exp
             | TmComLTEQ Exp Exp
             | TmComEQ Exp Exp
             | TmTypeAssign Type String Exp 
             | TmImport String String
             | TmPrint String
             | TmIterRepeat Exp Exp
             | TmIterWhile Exp Exp
             | TmIfThenElse Exp Exp Exp
             | TmIfThen Exp Exp
             | TmNumExpr Exp
             | TmCellList [[Int]]
             | TmTileList [String]
             | TmAppendH String String
             | TmAppendV String String
             | TmVar String
             | TmTrue 
             | TmFalse
             | TmFilled
             | TmBlank
             | TmTake Exp Exp Exp String
             | TmReflectRow String Exp 
             | TmReflectCol String Exp 
             | TmExpand String Exp
             | TmShrink String Exp
             | TmNeg String
             | TmAnd String String
             | TmOr String String
             | TmRepeatH String Int
             | TmRepeatV String Int
             | TmRotateCW Exp String 
             | TmRotateACW Exp String
             | TmComNOT Exp Exp
             | TmCont Exp Exp
  deriving (Show, Eq, Ord)
}
