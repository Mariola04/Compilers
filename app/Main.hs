module Main where
import Lexer
import Parser


main :: IO ()
main = do
  input <- getContents
  let tokens = alexScanTokens input
  print tokens
  let ast = parser tokens
  writeFile "ast.txt" $ show ast ++ "\n"
  print ast
