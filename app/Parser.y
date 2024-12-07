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
  | Stmt                                            { Statement $1 }

OptType
  : ':' Type                                        { Just $2 }
  |                                                 { Nothing }

Type
  : identifier                                      { TypeIdentifier $1 }
  | int                                             { IntType }
  | double                                          { DoubleType }
  | stringContent                                   { StringType }
  | true                                            { BoolType }
  | false                                           { BoolType }

------------------- Declarations ------------------
VarDecl
  : var identifier OptType '=' Expr                 { VarDeclaration $2 $3 $5 }

ValDecl
  : val identifier OptType '=' Expr                 { ValDeclaration $2 $3 $5 }

FunDecl
  : fun identifier '(' ParamList ')' Block          { FunDeclaration $2 $4 $6 }

ParamList
  :                                                 { [] }
  | identifier                                      { [$1] }
  | ParamList ',' identifier                        { $1 ++ [$3] }

-------------------- Blocks -------------------
Block
  : '{' StmtSeq '}'                                 { Block $2 }

StmtSeq
  :                                                 { [] }
  | Stmt                                            { [$1] }
  | StmtSeq Stmt                                    { $1 ++ [$2] }

-------------------- Statements -----------------

-- Atençao as redundancias por exemplo if aqui
Stmt
  : if Expr then Stmt                               { IfThen $2 $4 }
  | if Expr then Block                              { IfThen $2 (BlockStmt $4) }
  | if Expr then Stmt else Stmt                     { IfThenElse $2 $4 $6 }
  | if Expr then Stmt else Block                    { IfThenElse $2 $4 (BlockStmt $6) }
  | if Expr then Block else Stmt                    { IfThenElse $2 (BlockStmt $4) $6 }
  | if Expr then Block else Block                   { IfThenElse $2 (BlockStmt $4) (BlockStmt $6) }
  | while Expr Stmt                                 { While $2 $3 }
  | while Expr Block                                { While $2 (BlockStmt $3) } 
  | while Expr do Stmt                              { While $2 $4 }
  | while Expr do Block                             { While $2 (BlockStmt $4) }
  | return Expr                                     { Return $2 }
  | break                                           { Break }
  | Expr                                            { ExprStmt $1 }
  | Block                                           { BlockStmt $1 }
  | print Expr                                      { ExprStmt $2 }
  | println Expr                                    { ExprStmt $2 }

------------------- Function Calls ---------------
FuncCallExpr
  : identifier '(' ArgList ')'                      { FuncCall $1 $3 }
  | identifier '(' ')'                              { FuncCall $1 [] }

-------------------- Assignments -----------------
AssignExpr
  : identifier '=' Expr                             { Assign $1 $3 }

  
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
  | '(' Expr ')'                                    { Parenthesis $2 }
  | if Expr then Expr                               { IfThenExpr $2 $4 }
  | if Expr '{' Expr '}'                            { IfThenExpr $2 $4 }
  | if Expr '{' Expr '}' else '{' Expr '}'          { IfThenElseExpr $2 $4 $8 }
  | if Expr then Expr else Expr                     { IfThenElseExpr $2 $4 $6 }
  | FuncCallExpr                                    { $1 }
  | AssignExpr                                      { $1 }
  | identifier                                      { Var $1 }
  | identifier '++'                                 { Op Add (Var $1) (IntVal 1) }
  | identifier '--'                                 { Op Sub (Var $1) (IntVal 1) }
  | int                                             { IntVal $1 }
  | double                                          { DoubleVal $1 }
  | stringContent                                   { StringVal $1 }
  | true                                            { BoolLit True }
  | false                                           { BoolLit False }

ArgList
  : Expr                                            { [$1] }
  | ArgList ',' Expr                                { $1 ++ [$3] }


{
data Program = Begin [TopLevelExpr]
            deriving (Show, Eq, Read)


data TopLevelExpr = TopLevelFunDecl FunDecl
                  | TopLevelVarDecl VarDecl
                  | TopLevelValDecl ValDecl
                  | Statement Stmt
                deriving (Show, Eq, Read)


data VarDecl = VarDeclaration String (Maybe Type) Expr
             deriving (Show, Eq, Read)


data ValDecl = ValDeclaration String (Maybe Type) Expr
             deriving (Show, Eq, Read)


data FunDecl = FunDeclaration String [String] Block
          deriving (Show, Eq, Read)


data Block = Block [Stmt]
          deriving (Show, Eq, Read)


data Stmt
    = IfThen Expr Stmt
    | IfThenElse Expr Stmt Stmt
    | While Expr Stmt
    | Return Expr
    | Break
    | ExprStmt Expr
    | BlockStmt Block
    deriving (Show, Eq, Read)


data Expr
      = Op Op Expr Expr
      | Not Expr
      | Negative Expr
      | FuncCall String [Expr]
      | Assign String Expr
      | Var String
      | Parenthesis Expr
      | IntVal Int
      | DoubleVal Double
      | StringVal String
      | BoolLit Bool
      | IfThenExpr Expr Expr
      | IfThenElseExpr Expr Expr Expr
    deriving (Show, Eq, Read)

-- if repetido


data Type = TypeIdentifier String
            | IntType
            | DoubleType
            | StringType
            | BoolType
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
