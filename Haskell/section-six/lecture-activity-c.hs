{-
Same as b, but only exit (stop) if the user types in "QUIT" followed by an enter,
Otherwise, you keep running the program
You can test this by first compiling, then running "./lecture-activity-c"
-}

import Control.Concurrent

zero = do
    putStrLn "zero"
    zero

one = do
    putStrLn "one"
    one

checkInput :: String -> Bool
checkInput input 
    | input == "QUIT" = True
    | otherwise = False

main = do
    putStrLn "Baginning Transmission: "
    forkIO $ (zero)
    forkIO $ (one)
    exit <- getLine
    if checkInput exit
	then putStrLn "Thank you for using InfiniteCodeUIUC (TM)!"
	else main

