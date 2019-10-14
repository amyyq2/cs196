# Alma

## Due Date
This MP is extra credit and will be due October 30. 

## About
This MP will be making similar functionality to the `xargs` command on bash. The
nice things that you get out of xargs is the ability to pass arguments and read
them in one by one. For example, the autograder uses xargs heavily. There is a
list of netids for the class that get passed into xargs which passes each netid to
some program. 

Say we have a file like so 
```
a
b
c
```
and a script like
```
echo "$1"
```
If we do 
```
cat file | xargs bash script.sh
```

This will only print out the first argument, `a`. The reason being that xargs
interprets all of the file as a bunch of arguments. If we do `cat file | xargs
-L 1 bash script.sh`, it will run each of the arguments, separately. You can
imagine that when you have the `-L 1` argument, it running `bash script.sh a`,
`bash script.sh b`, and `bash script.sh c`. Furthermore, we can make this a lot
faster. There is another argument, `-P`, that allows you to run each command in
parallel. 

## Goals

### Line by Line Arguments 
Given a file, I should be able to pass in arguments and a script like above, and
it will run the script as if you only passed in one argument at a time. 

### Run them in parallel
Run the programs in parallel. Given an argument for the number of threads, you
can run the programs in parallel. The implementation of edge cases is up to you.

- The number of threads you can care about are 1-8, inclusive. 1 is the default of the program. 
- If a user enters more than 8, default to 8. 
- If there are only 5 scripts to run (say 5 arguments passed above), then you
  only need 5 threads, even if they pass in 8. 
- It is up to you to figure out how to run all of them in parallel. Say 200
  scripts to run with 8 threads, figure out how to keep running 8 threads at a
  time.


## Implementation
The implementation details are up to you, the design and everything. 

## Grading
This MP will be worth the same amount in extra credit as Plato. 
I will run the MP code similar to above, instead of xargs it will be alma.
NOTE - You must implement this in the alma directory, so that `cargo build` will
run in that directory.
```
cat file | xargs -L 1 bash script.sh
cat file | xargs -L 1 -P 8 bash script.sh
```

## Bonus
1. The best written code will get a copy of the book `The Pragmatic Programmer`
2. The fastest code will get a copy of the book `Introduction to Algorithms:
   CLRS`
