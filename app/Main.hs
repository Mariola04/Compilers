module Main where
import Lexer
import Parser


main :: IO ()
main = do
  input <- getContents
  let ast = parser (alexScanTokens input)
  writeFile "ast.txt" $ show ast ++ "\n"
