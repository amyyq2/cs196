module Lib ( string2Digits, digits2String, remainder, rsaEncode, rsaDecode, Key(..)) where
import Data.Char
import Data.List

string2Digits :: String -> [Int]
string2Digits = undefined

digits2String :: [Int] -> String
digits2String = undefined

remainder :: Int -> Int -> Int -> Int
remainder = undefined

data Key = PublicKey Int Int | PrivateKey Int Int

rsaEncode :: String -> Key -> [Int]
rsaEncode = undefined

rsaDecode :: [Int] -> Key -> String
rsaDecode = undefined


-- Feel free to add any helper functions
