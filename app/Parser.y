{
module Parser where
import Lexer

}

%name parser
%tokentype { Token }
%error { parseError }

%token

----------------- Reserved keywords ---------------
val                                                 { TokenVal }
var                                                 { TokenVar }
if                                                  { TokenIf }
else                                                { TokenElse }
while                                               { TokenWhile }
break                                               { TokenBreak }
return                                              { TokenReturn }
fun                                                 { TokenFun }
true                                                { TokenTrue }
false                                               { TokenFalse }
then                                                { TokenThen }
when                                                { TokenWhen }
do                                                  { TokenDo }
print                                               { TokenPrint }
println                                             { TokenPrintLn }
readln                                              { TokenReadLn }


-------------------- Operators --------------------                            
'=='                                                { TokenEq }
'!='                                                { TokenNeq }
'<'                                                 { TokenLt }
'<='                                                { TokenLeq }
'>'                                                 { TokenGt }
'>='                                                { TokenGeq }
'&&'                                                { TokenAnd }
'||'                                                { TokenOr }
'!'                                                 { TokenNot }
'='                                                 { TokenAssign }
'+'                                                 { TokenPlus }
'-'                                                 { TokenMinus }
'*'                                                 { TokenMult }
'/'                                                 { TokenDiv }
'%'                                                 { TokenMod }
'++'                                                { TokenInc }
'--'                                                { TokenDec }
'+='                                                { TokenPlusAssign }
'-='                                                { TokenMinusAssign }
'*='                                                { TokenMultAssign }
'/='                                                { TokenDivAssign }
'%='                                                { TokenModAssign }

-------------------- Punctuation -------------------                            
'('                                                 { TokenLParen }
')'                                                 { TokenRParen }
'{'                                                 { TokenLBrace }
'}'                                                 { TokenRBrace }
'['                                                 { TokenLBracket }
']'                                                 { TokenRBracket }
';'                                                 { TokenSemi }
','                                                 { TokenComma }
'.'                                                 { TokenDot }
':'                                                 { TokenColon }


--------------------- Literals ---------------------                           
int                                                 { TokenInt $$ }
double                                              { TokenDouble $$ }
identifier                                          { TokenId $$ }
stringContent                                       { Token_String $$ }


-------------------- Precedences -------------------                
%left '||'                
%left '&&'                
%nonassoc '==' '!='               
%nonassoc '<' '<=' '>' '>='               
%left '+' '-'               
%left '*' '/'               
%left '%'               


------------------- Grammar -------------------               
%%
Program               
  : TopLevelExprs                                   { Begin $1 }

TopLevelExprs               
  : TopLevelExpr                                    { [$1] }
  | TopLevelExprs TopLevelExpr                      { $1 ++ [$2] }

TopLevelExpr
  : FunDecl                                         { TopLevelFunDecl $1 }
  | VarDecl                                         { TopLevelVarDecl $1 }
  | ValDecl                                         { TopLevelValDecl $1 }
  | Expr                                            { Expression $1 }


OptType
  : ':' Type                                        { Just $2 }
  |                                                 { Nothing }
              
Type              
  : identifier                                      { TypeIdentifier $1 }
              
              
------------------- Declarations ------------------                             
VarDecl             
  : var identifier OptType '=' Expr                 { VarDeclaration $2 $3 $5 }

ValDecl
  : val identifier OptType '=' Expr                 { ValDeclaration $2 $3 $5 }

FunDecl
  : fun identifier '(' ParamList ')' '{' Expr '}'   { FunDeclaration $2 $4 $7 }

ParamList
  :                                                 { [] }
  | identifier                                      { [$1] }
  | ParamList ',' identifier                        { $1 ++ [$3] }


-------------------- Expressions -----------------
Expr
  : '!' Expr                                        { Not $2 }
  | '-' Expr                                        { Negative $2 }
  | Expr '||' Expr                                  { Op Or $1 $3 }
  | Expr '&&' Expr                                  { Op And $1 $3 }
  | Expr '==' Expr                                  { Op Eq $1 $3 }
  | Expr '!=' Expr                                  { Op Neq $1 $3 }
  | Expr '<' Expr                                   { Op Lt $1 $3 }
  | Expr '<=' Expr                                  { Op Leq $1 $3 }
  | Expr '>' Expr                                   { Op Gt $1 $3 }
  | Expr '>=' Expr                                  { Op Geq $1 $3 }
  | Expr '+' Expr                                   { Op Add $1 $3 }
  | Expr '-' Expr                                   { Op Sub $1 $3 }
  | Expr '*' Expr                                   { Op Mul $1 $3 }
  | Expr '/' Expr                                   { Op Div $1 $3 }
  | Expr '%' Expr                                   { Op Mod $1 $3 }
  | int                                             { IntLit $1 }
  | double                                          { DoubleLit $1 }
  | stringContent                                   { StringLit $1 }
  | true                                            { BoolLit True }
  | false                                           { BoolLit False }
  | identifier '(' ArgList ')'                      { FuncCall $1 $3 }
  | identifier '(' ')'                              { FuncCall $1 [] }
  | identifier                                      { Var $1 }
  | identifier '=' Expr                             { Assign $1 $3 }
  | '(' Expr ')'                                    { $2 }
  | print '(' Expr ')'                              { FuncCall "print" [$3] }
  | println '(' Expr ')'                            { FuncCall "println" [$3] }
  | readln '(' ')'                                  { FuncCall "readln" [] }
  | if Expr then Expr                               { IfThen $2 $4 }
  | if Expr '{' Expr '}'                            { IfThen $2 $4 }
  | if Expr '{' Expr '}' else '{' Expr '}'          { IfThenElse $2 $4 $8 }
  | if Expr then Expr else Expr                     { IfThenElse $2 $4 $6 }
  | while Expr do Expr                              { While $2 $4 }
  | return Expr                                     { Return $2 }
  | break                                           { Break }


ArgList
  : Expr                                            { [$1] }
  | ArgList ',' Expr                                { $1 ++ [$3] }
 

{
data Program = Begin [TopLevelExpr]
            deriving (Show, Eq, Read)


data TopLevelExpr = TopLevelFunDecl FunDecl
                  | TopLevelVarDecl VarDecl
                  | TopLevelValDecl ValDecl
                  | Expression Expr
                deriving (Show, Eq, Read)


data VarDecl = VarDeclaration String (Maybe Type) Expr
             deriving (Show, Eq, Read)


data ValDecl = ValDeclaration String (Maybe Type) Expr
             deriving (Show, Eq, Read)


data FunDecl = FunDeclaration String [String] Expr
          deriving (Show, Eq, Read)


data Type = TypeIdentifier String
          deriving (Show, Eq, Read)


data Expr
      = Op Op Expr Expr
      | Not Expr
      | Negative Expr
      | FuncCall String [Expr]
      | Var String
      | Assign String Expr
      | IntLit Int
      | DoubleLit Double
      | StringLit String
      | BoolLit Bool
      | IfThen Expr Expr
      | IfThenElse Expr Expr Expr
      | While Expr Expr
      | Return Expr
      | Break
    deriving (Show, Eq, Read)

data Op
        = Or
        | And
        | Eq
        | Neq
        | Lt
        | Leq
        | Gt
        | Geq
        | Add
        | Sub
        | Mul
        | Div
        | Mod
      deriving (Show, Eq, Read)
    

parseError :: [Token] -> a
parseError toks = error ("parse error at " ++ show toks)

}