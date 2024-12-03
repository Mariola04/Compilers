module Main where

import Lexer
import Parser
import IntermediateCode
import Control.Monad.State

main :: IO ()
main = do
    txt <- getContents
    let tokens = alexScanTokens txt
    let ast = parser tokens
    --------
    let intermediateCode = evalState (generateCode ast) (0,0)


    print intermediateCode -- Print the intermediate code

    -- let mipsCode = generateMIPS intermediateCode
    -- writeFile "output.asm" mipsCode
    -- putStrLn "MIPS code generated in output.asm"