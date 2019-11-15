# IO in Haskell
IO stands for Input/Output, and for today's prelecture we will be covering how to interact with standard input/output as well as files in Haskell.

## String I/O
For string IO, we must consider two things, standard input and standard output.
### Std In
For interacting with standard input, we will cover methods in haskell. `getLine` and `interact`
#### ***interact***
We will first discuss `interact`. The function signature is as follows:
```Haskell
interact    ::  (String -> String) -> IO ()
```

This means that interact takes in a function as a parameter. This function should accept a string and return a string. `interact` will take the input from standard input, pass it into the given function, and send the function's return value to standard output.

Lets look at the function `count` which I will define below.
```Haskell
count s = show (length s)
```
It takes in a string and returns the length of the string as a string.

Now, I have the following `main` method in my haskell program (note that `main` is what executes when the program is run)
```haskell
main = interact count
```
If the word 'hello' is passed into standard input when this program is run, I should expect to see 5 printed back to me on standard input since `count` gets run on the standard input.

To test this, I can run the following in my terminal to first compile the code `stack ghc a.hs` where `a.hs` is the name of my haskell file. This will then create an executable. I can then run `'hello' | ./a.exe` (Note, if you are not on windows, you will not have an exe file, but instead have a .out or some other executable file). This will then pass 'hello' in the executable as standard input.

#### ***getLine***
The other standard input method we will discuss is `getLine`. This method does as you would expect, it gets 1 line from standard input. Lets look at the following:

```Haskell
main = do
        line1 <- getLine
```

This main method gets a line of input and stores it into `line1`.

### Std out
For sending things to standard out, we have `putStrLn` which has the following signature
```Haskell
putStrLn :: String -> IO ()
```
It takes a string and sends it to standard out. Lets look at the following main method in a file called `a.hs`
```Haskell
main = do
        line1 <- getLine
        putStrLn line1
```
(Note, if you are unfamiliar with `do`, it combines two or more actions into a single action)

After we compile this code and create our executable. We can run `'hello world' | ./a.exe` (remember your executable may not be an .exe). This will run the program with 'hello world' as input. Our program first gets the line and saves into `line1`, then `putStrLn` is used to print 'hello world' back to standard output. Its that simple!

## File I/O
To interact with files, we have two functions `readFile` and `writeFile`
```Haskell
readFile  :: FilePath -> IO String
writeFile :: FilePath -> String -> IO ()
```

`readFile` takes in a file and creates an IO string from the contents of the file.
`writeFile` takes in a file and a string, and writes the string to the file.

 lets look at the following haskell program b.hs:
```Haskell
 import System.Environment
 main = do
         [source,destination] = getArgs
         myString <- readFile source
         writeFile destination myString
```

Note the use of `getArgs`, this is how you get the command line arguments that the program is run with. In this case, we will be asking for two arguments, a source file and destination file. This program reads in the source file and writes the contents to a destination file.
Try this function out for yourself to see if it works! Once you have the executable, you can run `./b.exe [source file name] [destination file name]`.


Thats it for the prelecture notes. If you are looking for an additional resource, you can checkout the Learn You a Haskell tutorial on [Inputs and Outputs](http://learnyouahaskell.com/input-and-output)
