module Lib ( string2Digits, digits2String, remainder, rsaEncode, rsaDecode, Key(..)) where
import Data.Char
import Data.List

string2Digits :: String -> [Int]
string2Digits msg = map (blockToInt 128 0) $ splitBlock 64 $ textToBlock msg 

digits2String :: [Int] -> String
digits2String msg = unwords splitText 
		  where splitText = map (blockToText . intToBlock) msg

remainder :: Int -> Int -> Int -> Int
remainder b x y 
	| x == 0 = 1
	| (odd x) = (b * (remainder (mbsq) (x `div` 2) y)) `mod` y
	| otherwise = (remainder (mbsq) (x `div` 2) y)
	where mbsq = (b*b) `mod` y

data Key = PublicKey Int Int | PrivateKey Int Int

rsaEncode :: String -> Key -> [Int]
rsaEncode msg key = show encoded
	where encoded = map (\x -> remainder x n e) $ string2Digits msg 

rsaDecode :: [Int] -> Key -> String
rsaDecode msg key = digits2String $ map (\x -> remainder x d n) $ encrypted
	where encrypted = read msg :: [Int]


-- Feel free to add any helper functions
textToBlock :: [Char] -> [Int]
textToBlock msg = map (ord) msg

blockToText :: [Int] -> [Char]
blockToText msg = map (chr) msg

splitBlock :: Int -> [Int] -> [[Int]]
splitBlock _ [] = []
splitBlock len msgBlock = frontBlock : splitBlock len restOfTheBlock
			 where frontBlock = take len msgBlock
			       restOfTheBlock = drop len msgBlock

blockToInt :: Integer -> Integer -> [Int] -> Integer
blockToInt _ _ [] = 0
blockToInt base exp (x:xs) = (fromIntegral (x) * base^exp) + (blockToInt base (exp+1) xs)

intToBlock :: Integer -> [Int]
intToBlock 0 = []
intToBlock msgi = fromIntegral (msgi `mod` 128) : intToBlock (msgi `div` 128)
