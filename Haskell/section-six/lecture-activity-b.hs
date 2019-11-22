{-
Create a program that prints out "Beginning Transmission:"
and then infinitely outputs the strings
"zero" and "one"
until the user presses "Enter." After that, print out
"Thank you for using InfiniteCodeUIUC (TM)!"
Accomplish this using using forkIO twice!
As you can see below, the program might continue printing for a few milliseconds after you press Enter,
this is fine.

To run this, compile using stack ghc, and run the executable

Example output:

Beginning Transmission:
zero
zero
zero
zero
zero
zero
zero
zero
one
zero
one
zero

zero
Thank you for using InfiniteCodeUIUC (TM)!
-}


import Control.Concurrent

zero = do
    putStrLn "zero"
    zero

one = do
    putStrLn "one"
    one

main = do
    putStrLn "Baginning Transmission: "
    forkIO $ (zero)
    forkIO $ (one)
    getLine
    putStrLn "Thank you for using InfiniteCodeUIUC (TM)"

