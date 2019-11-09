# Haskell Lecture 3
In the prelecture notes, you should have learned about higher order functions. They will be the focus of today's activity, but there is one more thing we need to cover before we jump into the activity: Lambda functions!

## Lambda Functions
Since a lot of higher order functions take as parameters, you may want to use a function but not want to go through the hassle of defining and naming it. Not to fear, anonymous functions are here for you!

An **anonymous function** is one that doesn't have a name! Here is an example of one that takes an input and increments it:
```haskell
\x -> x + 1
```
Lets break this down part by part:
- The `\` which indicates this is a lambda.
- 'x' the parameter for the function.
- '->' which separates the parameters from the body of the function
- 'x + 1' the body of the function.


To run this function we could do
```
ghci> (\x -> x + 1) 4
5
```
Wen we pass in 4 to the function, we get 5. 

If we wanted an anonymous function that takes two parameters `x` and `y`. we could do
```
ghci> (\x y -> x + y + 5) 3 4
12
```
The function takes `x` and `y`, adds them together, and adds 5 to that. And it's that simple!

Now that you know how to use and create lambdas (anonymous functions), you are ready to use them with higher order functions in this week's activity. Good Luck!