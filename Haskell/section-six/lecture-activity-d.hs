{-
Write a function that allows the user to input a number. After they enter
a number, then your function should print "Setting reminder for %d seconds" set a reminder for that many seconds,
then wait for that many seconds, then print "Your timer is up!" and Use the ASCII Bell to make a "BING" sound

You will need the function threadDelay, and multiply the user input by 10^6, in order to convert
microseconds into seconds. Also, threadDelay is only available with ghc.
To make the ASCII bell sound, then put \BEL at the end of your string!

To run this, you can first compile using stack ghc, then run "cat timer.txt | ./lecture-activity-d"
-}


import Control.Concurrent
import Text.Printf
import Control.Monad

main = undefined

-- you may wish to use this function
setReminder :: String -> IO ()
setReminder = undefined
