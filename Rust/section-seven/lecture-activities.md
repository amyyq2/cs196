# Map Reduce

We are going to use threads to implement map-reduce in Rust ! There is going to
be some starter code given. Writing a word count function using map reduce is a
standard task. The procedure is as follows
- take each word and convert it into word tokens like `("the", 1)`
- sort the word tokens
- add up all the word tokens to get a count of all the words. 

Your output should look something like this after running this command
```Bash
josh$ cargo run | sort -k2 -n -t, 
```

```Bash
...
this,14
use,14
by,15
public,15
their,15
who,16
from,19
which,21
be,23
for,23
it,23
not,28
that,31
he,33
as,37
in,45
and,47
his,48
is,53
a,61
to,90
of,102
the,127
```

## TODO
Fill out the areas with the `@TODO` comments that relate to threading.
