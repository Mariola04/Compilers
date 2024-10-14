module Main where
import Lexer


main :: IO ()
main = do
  input <- getContents
  let ast = (alexScanTokens input)
  writeFile "ast.txt" $ show ast ++ "\n"
