module Main where

import Lexer
import Parser
import IntermediateCode
import Control.Monad.State
import qualified Data.Map as Map
import Data.Map (Map)

main :: IO ()
main = do
    txt <- getContents
    let tokens = alexScanTokens txt
    let ast = parser tokens
    --------
    let intermediateCode = evalState (generateCode ast) (Map.empty, (0,0))


    print intermediateCode -- Print the intermediate code

    -- let mipsCode = generateMIPS intermediateCode
    -- writeFile "output.asm" mipsCode
    -- putStrLn "MIPS code generated in output.asm"