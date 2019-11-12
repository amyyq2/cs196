module Lib (shift, cipherEncode, cipherDecode ) where
import Data.Char
import Data.List

shift :: Char -> Int -> Char
shift l n | isLower l = chr $ ((ord l - ord 'a' + n) `mod` 26) + ord 'a'
	  | isUpper l = chr $ ((ord l - ord 'A' + n) `mod` 26) + ord 'A'
	  | otherwise = l

cipherEncode :: String -> Int -> String
cipherEncode ss n = [shift l n | l <- ss]

cipherDecode :: String -> Int -> String
cipherDecode ss n = [shift l (- n) | l <- ss]

-- Feel free to add any helper functions
