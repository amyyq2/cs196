{-
Using "main = do," sum all the numbers from 1 to to the user imput in a thread, and then print the result
once you are done. In this version, we want for the user to be able to continue to enter new numbers
while calculating the summation. This can be accomplished with 2 "forkIOs" and
one newEmptyMVar.

As we discussed in the previous problem, taking the sum up till a large number can take quite a bit of time,
so if the input number is greater than 2000000, spin up 2 threads instead of 1 and make each do half the work! (This part is optional but recommended)

To test this, try compiling, then running "./lecture-activity-b"
You should now be able to enter a number to take the sum till. Your output should look something like the following:
(Note here that anything with (user input) next to it was typed in by the user)
10 (user input)
Calculating sum from 1 to 10, please wait...
The sum from 1 to 10 is 55
10000000 (user input)
Calculating the sum from 1 to 10000000, please wait...
12 (user input)
Calculating the sum from 1 to 12, please wait...
The sum from 1 to 12 is 78
The sum from 1 to 10000000 is 50000005000000


Note how we were able to enter and get the usm for 12 before the sum from 10000000 was done

-}

import Control.Concurrent

main = undefined
