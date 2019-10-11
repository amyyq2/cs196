Please fill out the text file and submit it via Git like so

```
1. A
2. B
3. C
4. D
5. B
```



1. What two values will fix this enum declaration for the standard library's `Result`type. 

    ```Rust
    enum Result <_, _> {
     	OK(_),
        Err(_)
    } 
    ```

    ```
    A. T, S
    B. T, T
    C. T, E
    ```



2. Can a function return a generic type `T`?

    ```
    A. True
    B. False
    ```



3. Using generics causes the code to run slower. 

    ```
    A. True
    B. False
    ```



4. What trait bound does one need to have a sorting algorithm implementation work on different data types?

    ```
    A. std::cmp::PartialOrd
    B. std::cmp::Sorting
    C. std::Display
    ```



5. What is the best way to fix this ?

```rust
fn longest<'a>(x: &str, y: &str) -> &'a str {
    let result = String::from("really long string");
    result.as_str()
}
```

```
A. Add a new lifetime parameter to result
B. Return result
C. Change the return lifetime parameter in the function signature
```

