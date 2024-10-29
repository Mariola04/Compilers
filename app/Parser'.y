{
module Parser where
import Lexer
}

%name parser
%tokentype { Token }
%error { parseError }

%token

-- reserved kotlin keywords
val { TokenVal }
var { TokenVar }
if { TokenIf }
else { TokenElse }
while { TokenWhile }
break { TokenBreak }
return { TokenReturn }
fun { TokenFun }
true { TokenTrue }
false { TokenFalse }
then { TokenThen }
when { TokenWhen }

-- could be useful
-- throw { TokenThrow }
-- try { TokenTry }
-- catch { TokenCatch }
-- finally { TokenFinally }
-- for { TokenFor }
-- do { TokenDo }
-- continue { TokenContinue }
-- is { TokenIs }
-- as { TokenAs }
-- in { TokenIn }
-- class { TokenClass }
-- this { TokenThis }
-- super { TokenSuper }
-- null { TokenNull }

-- operators
"==" { TokenEq }
"!=" { TokenNeq }
"<" { TokenLt }
"<=" { TokenLeq }
">" { TokenGt }
">=" { TokenGeq }
"&&" { TokenAnd }
"||" { TokenOr }
"!" { TokenNot }
"=" { TokenAssign }
"+" { TokenPlus }
"-" { TokenMinus }
"*" { TokenMult }
"/" { TokenDiv }
"%" { TokenMod }
"++" { TokenInc }
"--" { TokenDec }
"+=" { TokenPlusAssign }
"-=" { TokenMinusAssign }
"*=" { TokenMultAssign }
"/=" { TokenDivAssign }
"%=" { TokenModAssign }



-- punctuation
"(" { TokenLParen }
")" { TokenRParen }
"{" { TokenLBrace }
"}" { TokenRBrace }
"[" { TokenLBracket }
"]" { TokenRBracket }
";" { TokenSemi }
"," { TokenComma }
"." { TokenDot }
":" { TokenColon }

-- identifiers
{identifier} { TokenIdent $1 }

-- literals
{integer} { TokenInt $1 }
{double} { TokenDouble $1 }

-- comments
{comment} ;

-- strings
{string} { TokenString $1 }

%start program
%%
program : stmts { $1 }

stmts : stmt stmts { $1 : $2 }
      | stmt { $1 }

stmt : expr ";" { $1 }
        | varDecl ";" { $1 }
        | ifStmt { $1 }
        | whileStmt { $1 }
        | returnStmt ";" { $1 }
        | breakStmt ";" { $1 }
        | funDecl { $1 }

varDecl : val identifier ":" type "=" expr { VarDecl $2 $4 $6 }
        | var identifier ":" type "=" expr { VarDecl $2 $4 $6 }

ifStmt : if "(" expr ")" stmt { If $3 $5 }
        | if "(" expr ")" stmt else stmt { IfElse $3 $5 $7 }

whileStmt : while "(" expr ")" stmt { While $3 $5 }

returnStmt : return expr { Return $2 }

breakStmt : break { Break }

funDecl : fun identifier "(" params ")" ":" type "=" stmt { FunDecl $2 $4 $6 $8 }

params : param "," params { $1 : $3 }
        | param { $1 }

param : identifier ":" type { Param $1 $3 }

type : "Int" { TypeInt }
    | "Double" { TypeDouble }
    | "String" { TypeString }
    | "Bool" { TypeBool }
    | "Unit" { TypeUnit }



%%
parseError :: [Token] -> a
parseError _ = error "Parse error"


