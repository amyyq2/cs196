import System.IO
import Data.Char

--- write a new copy of the getLine function, which we will call "newGetLine"
--- Hint: you will need to use "getChar"
--- you do not need to handle errors
--- to test this function, create a "main" function, compile, and run `cat tweet.txt | lecture_activity_d.hs`

newGetLine :: IO String
newGetLine = do 
    c <- getChar
    if c == '\n' then return ""
    else
	do
	    s <- getLine
	    return (c:s)

main = undefined
