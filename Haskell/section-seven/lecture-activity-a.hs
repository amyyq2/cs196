{-
Using "main = do," sum all the numbers from start to end, and then print the result
once you are done. Doing this in 1 thread can take quite a bit of time, so split up the work and use 4 threads!
Hint, use mVars to store the results for each thread!
You may want to first try this problem by having a secondary thread take the sum over all the values to get the hang of it!
To run this, you can first compile the code, then run "./lecture-activity-a [start value] [end value]"
An example input would be "./lecture-activity-a 1 1000000" to take the sum from 1 to a million

To see that your code is actually running faster with the threads, time it!
You can try running "time ./lecture-activity-a 1 1000000" to see how long it takes
Try it with different numbers of threads to see how the time changes!
-}

import Control.Concurrent
import System.Environment
main = do
	[start, end] <- getArgs
	e <- newEmptyMVar
	forkIO $ putMVar = (sum [(read start :: Integer)..(read end :: Integer)])
	a <- takeMVar e
	print (a)
