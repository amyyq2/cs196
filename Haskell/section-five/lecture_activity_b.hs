import System.IO
import Data.Char

--- we have given you a main function, that uses a function in Haskell called "getContents" (We recommend that you look up how it works for testing purposes!)
--- main is outputting the filtered output of the contents after being put into a function you will create called "longLinesOnly"
--- long lines only will output a line, only if it is longer than 9 characters
--- you will want to use the functions "filter" and "lines" to accomplish this task
--- To test first run `stack ghc lecture_activity_b.hs`, then run `cat tweet.txt | ./lecture_activity_b
	
main = do
    contents <- getContents
    putStr (longLinesOnly contents)

longLinesOnly :: String -> String
longLinesOnly s = 
    let
	xs = lines s
	y = filter (\s -> (length s) < 9) xs
    in unlines y
