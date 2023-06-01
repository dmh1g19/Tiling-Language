{
module Token where
}

%wrapper "posn"

--digit
$digit = 0-9
--alphabet
$alpha = [a-zA-Z]
--lower case alphabet
$alphaLower = [a-z]
--special
$special = [\_\’] 

tokens :-
  $white+ ;
  "//".*  ;
  Base                                    { \p s -> TokenTypeBase p }
  Int                                     { \p s -> TokenTypeInt p }
  Bool                                    { \p s -> TokenTypeBool p }
  cells                                   { \p s -> TokenCells p }
  rotate                                  { \p s -> TokenRotate p }
  CW                                      { \p s -> TokenDirCw p }
  ACW                                     { \p s -> TokenDirAcw p }
  reflect                                 { \p s -> TokenReflect p }
  on                                      { \p s -> TokenOn p }
  row                                     { \p s -> TokenRow p }
  col                                     { \p s -> TokenCol p }
  expand                                  { \p s -> TokenExpand p }
  by                                      { \p s -> TokenBy p }
  take                                    { \p s -> TokenTake p }
  size                                    { \p s -> TokenSize p }
  from                                    { \p s -> TokenFrom p }
  neg                                     { \p s -> TokenNeg p }
  and                                     { \p s -> TokenAnd p }
  or                                      { \p s -> TokenOr p }
  \&\&                                    { \p s -> TokenAndOp p }
  \|\|                                    { \p s -> TokenOrOp p }
  get                                     { \p s -> TokenGet p }
  width                                   { \p s -> TokenWidth p }
  length                                  { \p s -> TokenLength p }
  import                                  { \p s -> TokenImport p } 
  file                                    { \p s -> TokenFile p }
  as                                      { \p s -> TokenAs p }
  print                                   { \p s -> TokenPrint p }
  repeat                                  { \p s -> TokenRepeat p }
  while                                   { \p s -> TokenWhile p }
  end                                     { \p s -> TokenEnd p }
  if                                      { \p s -> TokenIf p }
  then                                    { \p s -> TokenThen p }
  else                                    { \p s -> TokenElse p }
  do                                      { \p s -> TokenDo p }           
  \=                                      { \p s -> TokenAssign p }
  \;                                      { \p s -> TokenSem p }
  \:                                      { \p s -> TokenColon p }
  \.                                      { \p s -> TokenDot p }
  \(                                      { \p s -> TokenLParen p }
  \)                                      { \p s -> TokenRParen p }
  \[                                      { \p s -> TokenLBracket p }
  \]                                      { \p s -> TokenRBracket p }
  \{                                      { \p s -> TokenLCurBracket p }
  \}                                      { \p s -> TokenRCurBracket p }
  \|                                      { \p s -> TokenBar p }
  \-\&                                    { \p s -> TokenAppHor p }
  \+\&                                    { \p s -> TokenAppVer p }
  \-\*                                    { \p s -> TokenMulHor p}
  \+\*                                    { \p s -> TokenMulVer p}
  \/                                      { \p s -> TokenDiv p}
  \*                                      { \p s -> TokenMul p}
  \+                                      { \p s -> TokenPlus p }
  \-                                      { \p s -> TokenMinus p }
  \<                                      { \p s -> TokenLT p }
  \>                                      { \p s -> TokenGT p }
  \>\=                                    { \p s -> TokenGTE p }
  \<\=                                    { \p s -> TokenLTE p }    
  \=\=                                    { \p s -> TokenEQ p }
  \!\=                                    { \p s -> TokenNEQ p }
  \|\|                                    { \p s -> TokenLogicOr p }
  \&\&                                    { \p s -> TokenLogicAnd p }
  '0'                                     { \p s -> TokenBlank p }
  '1'                                     { \p s -> TokenFilled p }
  $alphaLower [$alpha $digit $special]*   { \p s -> TokenIdentifier p s } 
  $digit+                                 { \p s -> TokenInteger p (read s) } 
{
-- Each action has type :: AlexPosn -> String -> Token 

--Helper Function
tok f p s = f p s

data Token =
  TokenDo AlexPosn                    |
  TokenColon AlexPosn                 |
  TokenCells AlexPosn                 |
  TokenTypeBool AlexPosn              |
  TokenTypeBase AlexPosn              |
  TokenTypeInt AlexPosn               |
  TokenRotate AlexPosn                |
  TokenDirCw AlexPosn                 |
  TokenDirAcw AlexPosn                |
  TokenReflect AlexPosn               |
  TokenOn AlexPosn                    |
  TokenRow AlexPosn                   |
  TokenCol AlexPosn                   |
  TokenExpand AlexPosn                |
  TokenBy AlexPosn                    |  
  TokenTake AlexPosn                  |
  TokenSize AlexPosn                  |
  TokenFrom AlexPosn                  |
  TokenNeg AlexPosn                   |
  TokenAnd AlexPosn                   |
  TokenOr  AlexPosn                   |
  TokenAndOp AlexPosn                 |
  TokenOrOp AlexPosn                  |
  TokenGet AlexPosn                   |
  TokenWidth AlexPosn                 |
  TokenLength AlexPosn                |
  TokenImport AlexPosn                |
  TokenAs AlexPosn                    |
  TokenPrint AlexPosn                 |
  TokenRepeat AlexPosn                |
  TokenWhile AlexPosn                 |
  TokenEnd AlexPosn                   |
  TokenIf AlexPosn                    |
  TokenThen AlexPosn                  |
  TokenElse AlexPosn                  |
  TokenAssign AlexPosn                |
  TokenSem AlexPosn                   |
  TokenLParen AlexPosn                |
  TokenRParen AlexPosn                |
  TokenLBracket AlexPosn              |
  TokenRBracket AlexPosn              |
  TokenLCurBracket AlexPosn           |
  TokenRCurBracket AlexPosn           |
  TokenBar AlexPosn                   |
  TokenAppHor AlexPosn                |
  TokenAppVer AlexPosn                |
  TokenMulHor AlexPosn                |
  TokenMulVer AlexPosn                |
  TokenDiv AlexPosn                   |
  TokenMul AlexPosn                   |
  TokenPlus AlexPosn                  |
  TokenMinus AlexPosn                 |
  TokenLT AlexPosn                    |
  TokenGT AlexPosn                    |
  TokenGTE AlexPosn                   |
  TokenLTE AlexPosn                   |
  TokenEQ AlexPosn                    |
  TokenNEQ AlexPosn                   |
  TokenLogicOr AlexPosn               |
  TokenLogicAnd AlexPosn              |
  TokenBlank AlexPosn                 |
  TokenFilled AlexPosn                |
  TokenIdentifier AlexPosn String     |
  TokenInteger AlexPosn Int           |
  TokenFile AlexPosn                  |
  TokenDot AlexPosn
  deriving (Eq,Show)

tokenPosn :: Token -> String
tokenPosn (TokenColon (AlexPn a l c))              = show(l) ++ ":" ++ show(c)
tokenPosn (TokenOrOp (AlexPn a l c))              = show(l) ++ ":" ++ show(c)
tokenPosn (TokenAndOp (AlexPn a l c))             = show(l) ++ ":" ++ show(c)
tokenPosn (TokenDo (AlexPn a l c))                = show(l) ++ ":" ++ show(c)
tokenPosn (TokenDot (AlexPn a l c))               = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFile (AlexPn a l c))              = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTypeBool (AlexPn a l c))          = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTypeBase (AlexPn a l c))          = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTypeInt (AlexPn a l c))           = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRotate (AlexPn a l c))            = show(l) ++ ":" ++ show(c)
tokenPosn (TokenDirCw (AlexPn a l c))             = show(l) ++ ":" ++ show(c)
tokenPosn (TokenDirAcw (AlexPn a l c))            = show(l) ++ ":" ++ show(c)
tokenPosn (TokenReflect (AlexPn a l c))           = show(l) ++ ":" ++ show(c)
tokenPosn (TokenOn (AlexPn a l c))                = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRow (AlexPn a l c))               = show(l) ++ ":" ++ show(c)
tokenPosn (TokenCol (AlexPn a l c))               = show(l) ++ ":" ++ show(c)
tokenPosn (TokenExpand (AlexPn a l c))            = show(l) ++ ":" ++ show(c)
tokenPosn (TokenBy (AlexPn a l c))                = show(l) ++ ":" ++ show(c)
tokenPosn (TokenTake (AlexPn a l c))              = show(l) ++ ":" ++ show(c)
tokenPosn (TokenSize (AlexPn a l c))              = show(l) ++ ":" ++ show(c)
tokenPosn (TokenFrom (AlexPn a l c))              = show(l) ++ ":" ++ show(c)
tokenPosn (TokenNeg (AlexPn a l c))               = show(l) ++ ":" ++ show(c)
tokenPosn (TokenAnd (AlexPn a l c))               = show(l) ++ ":" ++ show(c)
tokenPosn (TokenOr (AlexPn a l c))                = show(l) ++ ":" ++ show(c)
tokenPosn (TokenGet (AlexPn a l c))               = show(l) ++ ":" ++ show(c)
tokenPosn (TokenWidth (AlexPn a l c))             = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLength (AlexPn a l c))            = show(l) ++ ":" ++ show(c)
tokenPosn (TokenImport (AlexPn a l c))            = show(l) ++ ":" ++ show(c)
tokenPosn (TokenAs (AlexPn a l c))                = show(l) ++ ":" ++ show(c)
tokenPosn (TokenPrint (AlexPn a l c))             = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRepeat (AlexPn a l c))            = show(l) ++ ":" ++ show(c)
tokenPosn (TokenWhile (AlexPn a l c))             = show(l) ++ ":" ++ show(c)
tokenPosn (TokenEnd (AlexPn a l c))               = show(l) ++ ":" ++ show(c)
tokenPosn (TokenIf (AlexPn a l c))                = show(l) ++ ":" ++ show(c)
tokenPosn (TokenThen (AlexPn a l c))              = show(l) ++ ":" ++ show(c)
tokenPosn (TokenElse (AlexPn a l c))              = show(l) ++ ":" ++ show(c)
tokenPosn (TokenAssign (AlexPn a l c))            = show(l) ++ ":" ++ show(c)
tokenPosn (TokenSem (AlexPn a l c))               = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLParen (AlexPn a l c))            = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRParen (AlexPn a l c))            = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLBracket (AlexPn a l c))          = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRBracket (AlexPn a l c))          = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLCurBracket (AlexPn a l c))       = show(l) ++ ":" ++ show(c)
tokenPosn (TokenRCurBracket (AlexPn a l c))       = show(l) ++ ":" ++ show(c)
tokenPosn (TokenBar (AlexPn a l c))               = show(l) ++ ":" ++ show(c)
tokenPosn (TokenAppHor (AlexPn a l c))            = show(l) ++ ":" ++ show(c)
tokenPosn (TokenAppVer (AlexPn a l c))            = show(l) ++ ":" ++ show(c)
tokenPosn (TokenMulHor (AlexPn a l c))            = show(l) ++ ":" ++ show(c)
tokenPosn (TokenMulVer (AlexPn a l c))            = show(l) ++ ":" ++ show(c)
tokenPosn (TokenDiv (AlexPn a l c))               = show(l) ++ ":" ++ show(c)
tokenPosn (TokenMul (AlexPn a l c))               = show(l) ++ ":" ++ show(c)
tokenPosn (TokenPlus (AlexPn a l c))              = show(l) ++ ":" ++ show(c)
tokenPosn (TokenMinus (AlexPn a l c))             = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLT (AlexPn a l c))                = show(l) ++ ":" ++ show(c)
tokenPosn (TokenGT (AlexPn a l c))                = show(l) ++ ":" ++ show(c)
tokenPosn (TokenGTE (AlexPn a l c))               = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLTE (AlexPn a l c))               = show(l) ++ ":" ++ show(c)
tokenPosn (TokenEQ (AlexPn a l c))                = show(l) ++ ":" ++ show(c)
tokenPosn (TokenNEQ (AlexPn a l c))               = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLogicOr (AlexPn a l c))           = show(l) ++ ":" ++ show(c)
tokenPosn (TokenLogicAnd (AlexPn a l c))          = show(l) ++ ":" ++ show(c)
tokenPosn (TokenBlank (AlexPn a l c))             = show(l) ++ ";" ++ show(c)
tokenPosn (TokenFilled (AlexPn a l c))            = show(l) ++ ";" ++ show(c)
tokenPosn (TokenIdentifier (AlexPn a l c) _)      = show(l) ++ ":" ++ show(c)
tokenPosn (TokenInteger (AlexPn a l c) _)         = show(l) ++ ":" ++ show(c)
tokenPosn (TokenCells (AlexPn a l c))             = show(l) ++ ":" ++ show(c)
}
