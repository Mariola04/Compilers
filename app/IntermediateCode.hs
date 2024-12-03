module IntermediateCode where

import Parser

import Data.Map (Map)
import qualified Data.Map as Map
import Control.Monad.State

type Temp = String
type Label = String

type Table = Map String String
type Count = (Int, Int)

data Instr = MOVE Temp Temp
           | MOVEI Temp Int
           | MOVES Label String
           deriving (Show, Eq, Read)


generateCode :: Program -> State Count [Instr]
generateCode (Begin topLevelExpr) = do
  return []