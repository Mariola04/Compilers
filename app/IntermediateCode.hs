module IntermediateCode where

import qualified Parser as P
import Data.Map (Map)
import qualified Data.Map as Map
import Control.Monad.State

type Table = Map String String
type Temp = String
type Label = String
type Count = (Int, Int)

type CGState = (Table, Count)

getTable :: State CGState Table
getTable = gets fst

putTable :: Table -> State CGState ()
putTable t = modify (\(_, c) -> (t, c))

getCount :: State CGState Count
getCount = gets snd

putCount :: Count -> State CGState ()
putCount c = modify (\(t, _) -> (t, c))

newTemp :: State CGState Temp
newTemp = do
  (table, (t, l)) <- get
  let temp = "$t" ++ show t
  put (table, (t + 1, l))
  return temp

popTemp :: Int -> State CGState ()
popTemp k = do
  (table, (t, l)) <- get
  put (table, (t - k, l))

newLabel :: State CGState Label
newLabel = do
  (table, (t, l)) <- get
  let lbl = "L" ++ show l
  put (table, (t, l + 1))
  return lbl

data Instr
  = MOVE String String
  | MOVEI String Int
  | MOVES Label String
  | OP BinOp String String String
  | LABEL Label
  | JUMP Label
  | COND String RelOp String Label Label
  | CALL String String [String]
  | RETURN String
  | FUN String [String] [Instr]
  | INC String               -- Increment operation
  | DEC String               -- Decrement operation
  deriving (Show, Eq, Read)



data BinOp = Add | Minus | Times | Div | Mod
  deriving (Eq, Show, Read)

data RelOp = Less | LessEq | Greater | GreaterEq | Equals | NotEquals
  deriving (Eq, Show, Read)

-- TODO: TESTES!!!!!!!!!!!!!!! 
-- IMPLEMENTAR O WHEN???? 
-- print é para adicionar?? fun devia estar lá? NO INSTR????  ANDREEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE


generateCode :: P.Program -> State CGState [Instr]
generateCode (P.Begin tops) = generateTopLevelExprs tops

generateTopLevelExprs :: [P.TopLevelExpr] -> State CGState [Instr]
generateTopLevelExprs [] = return []
generateTopLevelExprs (x:xs) = do
  c1 <- generateTopLevelExpr x
  c2 <- generateTopLevelExprs xs
  return (c1 ++ c2)

generateTopLevelExpr :: P.TopLevelExpr -> State CGState [Instr]
generateTopLevelExpr (P.TopLevelFunDecl f) = generateFunDecl f
generateTopLevelExpr (P.TopLevelVarDecl v) = generateVarDecl v
generateTopLevelExpr (P.TopLevelValDecl v) = generateValDecl v
generateTopLevelExpr (P.Statement s) = do
  dest <- newTemp
  code <- generateStmt s dest ""
  popTemp 1
  return code

generateFunDecl :: P.FunDecl -> State CGState [Instr]
generateFunDecl (P.FunDeclaration ident params block) = do
  dest <- newTemp
  _ <- generateParams params
  code <- generateBlock block dest ""
  popTemp (length params + 1)
  return [FUN ident params (code ++ [RETURN dest])]

generateParams :: [String] -> State CGState [String]
generateParams [] = return []
generateParams (p:ps) = do
  table <- getTable
  putTable (Map.insert p p table)
  rest <- generateParams ps
  return (p:rest)

generateVarDecl :: P.VarDecl -> State CGState [Instr]
generateVarDecl (P.VarDeclaration ident _ expr) = do
  temp <- newTemp
  codeExpr <- generateExpr expr temp ""
  table <- getTable
  putTable (Map.insert ident ident table)
  popTemp 1
  return (codeExpr ++ [MOVE ident temp])

generateValDecl :: P.ValDecl -> State CGState [Instr]
generateValDecl (P.ValDeclaration ident _ expr) = do
  temp <- newTemp
  codeExpr <- generateExpr expr temp ""
  table <- getTable
  putTable (Map.insert ident ident table)
  popTemp 1
  return (codeExpr ++ [MOVE ident temp])

generateBlock :: P.Block -> String -> Label -> State CGState [Instr]
generateBlock (P.Block stmts) dest breakLabel = generateStmts stmts dest breakLabel

generateStmts :: [P.Stmt] -> String -> Label -> State CGState [Instr]
generateStmts [] _ _ = return []
generateStmts (s:ss) d br = do
  c1 <- generateStmt s d br
  c2 <- generateStmts ss d br
  return (c1 ++ c2)

generateStmt :: P.Stmt -> String -> Label -> State CGState [Instr]
generateStmt (P.IfThen cond stmt) dest br = do
  lt <- newLabel
  lf <- newLabel
  cc <- generateCond cond lt lf br
  ct <- generateStmt stmt dest br
  return (cc ++ [LABEL lt] ++ ct ++ [LABEL lf])

generateStmt (P.IfThenElse cond st f) dest br = do
  lt <- newLabel
  lf <- newLabel
  le <- newLabel
  cc <- generateCond cond lt lf br
  ct <- generateStmt st dest br
  cf <- generateStmt f dest br
  return (cc ++ [LABEL lt] ++ ct ++ [JUMP le, LABEL lf] ++ cf ++ [LABEL le])

generateStmt (P.While cond stmt) dest _ = do
  lc <- newLabel
  lb <- newLabel
  le <- newLabel
  cc <- generateCond cond lb le le
  cb <- generateStmt stmt dest le
  return ([LABEL lc] ++ cc ++ [LABEL lb] ++ cb ++ [JUMP lc, LABEL le])

generateStmt (P.Return expr) dest br = do
  code <- generateExpr expr dest br
  return (code ++ [RETURN dest])

generateStmt P.Break _ br = return [JUMP br]

generateStmt (P.ExprStmt e) dest br = generateExpr e dest br
generateStmt (P.BlockStmt b) dest br = generateBlock b dest br

generateExpr :: P.Expr -> String -> Label -> State CGState [Instr]
generateExpr (P.Var ident) dest _ = do
  table <- getTable
  case Map.lookup ident table of
    Just varName -> return [MOVE dest varName]
    Nothing -> error ("Variable " ++ ident ++ " not declared")

generateExpr (P.Assign ident expr) dest br = do
  code <- generateExpr expr dest br
  table <- getTable
  case Map.lookup ident table of
    Just _ -> return (code ++ [MOVE ident dest])
    Nothing -> error ("Variable " ++ ident ++ " not declared")

generateExpr (P.FuncCall ident args) dest br = do
  (cargs, temps) <- generateExprs args br
  popTemp (length temps)
  return (cargs ++ [CALL dest ident temps])

generateExpr (P.Op P.Add (P.Var ident) (P.IntVal 1)) dest br = do
  table <- getTable
  case Map.lookup ident table of
    Just varName -> return [INC varName]
    Nothing -> error ("Variable " ++ ident ++ " not declared")

generateExpr (P.Op P.Sub (P.Var ident) (P.IntVal 1)) dest br = do
  table <- getTable
  case Map.lookup ident table of
    Just varName -> return [DEC varName]
    Nothing -> error ("Variable " ++ ident ++ " not declared")


generateExpr (P.IfThenExpr cond expr) dest br = do
  lt <- newLabel
  lf <- newLabel
  le <- newLabel
  cc <- generateCond cond lt lf br
  ct <- generateExpr expr dest br
  return (cc ++ [LABEL lt] ++ ct ++ [JUMP le, LABEL lf, LABEL le])

generateExpr (P.IfThenElseExpr cond t f) dest br = do
  lt <- newLabel
  lf <- newLabel
  le <- newLabel
  cc <- generateCond cond lt lf br
  ct <- generateExpr t dest br
  cf <- generateExpr f dest br
  return (cc ++ [LABEL lt] ++ ct ++ [JUMP le, LABEL lf] ++ cf ++ [LABEL le])

generateExpr (P.Parenthesis e) dest br = generateExpr e dest br
generateExpr (P.IntVal n) dest _ = return [MOVEI dest n]
generateExpr (P.DoubleVal n) dest _ = return [MOVEI dest (round n)]
generateExpr (P.StringVal s) dest _ = do
  lbl <- newLabel
  return [MOVES lbl s, MOVE dest lbl]
generateExpr (P.BoolLit True) dest _ = return [MOVEI dest 1]
generateExpr (P.BoolLit False) dest _ = return [MOVEI dest 0]

generateExpr (P.Not e) dest br = do
  lt <- newLabel
  lf <- newLabel
  le <- newLabel
  cc <- generateCond (P.Not e) lt lf br
  return (cc ++ [LABEL lt, MOVEI dest 1, JUMP le, LABEL lf, MOVEI dest 0, LABEL le])

generateExpr (P.Negative e) dest br = do
  t1 <- newTemp
  c <- generateExpr e t1 br
  popTemp 1
  return (c ++ [OP Minus dest "0" t1])

generateExpr (P.Op op e1 e2) dest br =
  case opToBinOp op of
    Just bin -> do
      t1 <- newTemp
      t2 <- newTemp
      c1 <- generateExpr e1 t1 br
      c2 <- generateExpr e2 t2 br
      popTemp 2
      return (c1 ++ c2 ++ [OP bin dest t1 t2])
    Nothing -> case opToRelOp op of
      Just rel -> do
        lt <- newLabel
        lf <- newLabel
        le <- newLabel
        cc <- generateCond (P.Op op e1 e2) lt lf br
        return (cc ++ [LABEL lt, MOVEI dest 1, JUMP le, LABEL lf, MOVEI dest 0, LABEL le])
      Nothing -> error ("Unsupported operation: " ++ show op)

generateExpr expr _ _ = error ("Expression not handled: " ++ show expr)

generateExprs :: [P.Expr] -> Label -> State CGState ([Instr],[String])
generateExprs [] _ = return ([], [])
generateExprs (e:es) br = do
  temp <- newTemp
  c1 <- generateExpr e temp br
  (cr, ts) <- generateExprs es br
  return (c1 ++ cr, temp:ts)

generateCond :: P.Expr -> Label -> Label -> Label -> State CGState [Instr]
generateCond (P.Parenthesis e) lt lf br = generateCond e lt lf br
generateCond (P.Op op e1 e2) lt lf br =
  case opToRelOp op of
    Just r -> do
      t1 <- newTemp
      t2 <- newTemp
      c1 <- generateExpr e1 t1 br
      c2 <- generateExpr e2 t2 br
      popTemp 2
      return (c1 ++ c2 ++ [COND t1 r t2 lt lf])
    Nothing -> case op of
      P.And -> do
        la <- newLabel
        c1 <- generateCond e1 la lf br
        c2 <- generateCond e2 lt lf br
        return (c1 ++ [LABEL la] ++ c2)
      P.Or -> do
        lo <- newLabel
        c1 <- generateCond e1 lt lo br
        c2 <- generateCond e2 lt lf br
        return (c1 ++ [LABEL lo] ++ c2)
      _ -> error ("Unsupported conditional operation: " ++ show op)

generateCond (P.Not e) lt lf br = generateCond e lf lt br
generateCond (P.BoolLit True) lt _ _ = return [JUMP lt]
generateCond (P.BoolLit False) _ lf _ = return [JUMP lf]
generateCond (P.Var ident) lt lf _ = do
  table <- getTable
  case Map.lookup ident table of
    Just varName -> return [COND varName NotEquals "0" lt lf]
    Nothing -> error ("Variable " ++ ident ++ " not declared")

generateCond expr _ _ _ = error ("Conditional expression not handled: " ++ show expr)

opToBinOp :: P.Op -> Maybe BinOp
opToBinOp P.Add = Just Add
opToBinOp P.Sub = Just Minus
opToBinOp P.Mul = Just Times
opToBinOp P.Div = Just Div
opToBinOp P.Mod = Just Mod
opToBinOp _ = Nothing

opToRelOp :: P.Op -> Maybe RelOp
opToRelOp P.Eq = Just Equals
opToRelOp P.Neq = Just NotEquals
opToRelOp P.Lt = Just Less
opToRelOp P.Leq = Just LessEq
opToRelOp P.Gt = Just Greater
opToRelOp P.Geq = Just GreaterEq
opToRelOp _ = Nothing