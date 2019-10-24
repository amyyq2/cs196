Please fill out the text file and submit it via Git like so

```
1. A
2. B
3. C
```

1. Is the following code valid or not?

```rust
unsafe fn dangerous() {
    // Some dangerous code
}

dangerous();
```

```
A. It is not valid
B. It is valid
```



2. When is it not appropriate to use unsafe ? 

```
A. Calling code from another language
B. Dereferencing the raw pointer of some memory
C. Implementing an unsafe trait on some struct
D. Having multiple references of a value
```



3. Why do we need to use unsafe Rust to change a global mutable static variable?

```
A. It is static so it needs to be changed using unsafe
B. Rust cannot stop data races with global mutable variables
```

