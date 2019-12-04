# More on Thread Communication
Today, we will continue discussing how threads communicate. Previously, we learned about MVars, but this is really only useful if we only need to communicate 1 thing between the threads. An alternative is to use channels. Think of channels as a means of one-way communication. With a channel, you have two primary operations, read and write. This is extremely useful in haskell as threads can communicate with each other by having one thread write information to a channel that another thread can read from.

Haskell has the `Control.Concurrent.Chan` package for channels. You can check out the documentation [here](http://hackage.haskell.org/package/base-4.12.0.0/docs/Control-Concurrent-Chan.html).

For our purposes, we will be focusing on of the functions in this package, `newChan` which creates a channel, `readChan` which reads from a channel, and `writeChan` which writes to a channel. Lets look at an example of how this can be used.

```haskell
import Control.Concurrent
import Control.Concurrent.Chan

secondThread ch = do
    writeChan ch "hello world"

main = do
    ch <- newChan
    forkIO $ secondThread ch
    text <- readChan ch
    print text
```

In this example, we first create a channel called `ch`. We then create a secondThread and pass it the channel. The second threads writes "hello world" to the channel, and the main thread reads in the text from the channel and prints it to the screen. If we run this program, we get "hello world" printed to the screen. Great!

One important thing to note here though is that `readChan` will block (will wait) until something is written to it. So, we don't have to worry about the main thread going past the `readChan` line before the second thread writes to it.

Lets look at another example:

```Haskell
import Control.Concurrent
import Control.Concurrent.Chan
import Control.Monad (forever)

secondThread ch1 ch2 = do
  forever $ do
    text <- readChan ch1
    print text
    writeChan ch2 "read that input"

main = do
    ch1 <- newChan
    ch2 <- newChan
    forkIO $ secondThread ch1 ch2
    forever $ do
      writeChan ch1 "hello"
      response <- readChan ch2
      print response
```

One important note here is that we are using `forever` here. You can think of forever as being an infinite loop that will keep running.

In this example, we are using 2 channels `ch1` and `ch2`. We use `ch1` so the main thread can write to the secondThread, and we use `ch2` so that the secondThread can write to (communicate with) the mainThread.

Here, our second thread is in an infinite loop waiting for input to the `ch1`, it gets the input, prints it out, and sends a response via `ch2`. Our main thread is doing essentially the same thing. If we run this program, we will get "hello" followed by "read that input" being printed infinitely on the screen.

By setting up our threads like this (having them run on a loop waiting for input), we can effectively reuse threads. Rather than spinning up a new one every time we want to do something, in this way, we can simply just keep our threads alive to be reused when input is available!
