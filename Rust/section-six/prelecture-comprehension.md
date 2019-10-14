Please fill out the text file and submit it via Git like so

```
1. A
2. B
3. C
4. D
```



1. Smart pointers are similar to an ordinary struct except they implement which of these traits?

```
I - Display
II - Drop
III - Deref
```

```
A. I
B. I, II
C. I, III
D. II, III
```



2. Why does the following code fail ? 

```rust
enum List {
    Cons(i32, List),
    Nil,
}
```

```
A. You cannot define an enum using itself
B. You do not know the size of the enum at compile time
C. You cannot have a Nil type
```



3. What is the count after x goes out of scope ? Meaning, the last print
   statement.

```Rust
fn main() {
    let a = Rc::new(Cons(5, Rc::new(Cons(10, Rc::new(Nil)))));
    println!("count after creating a = {}", Rc::strong_count(&a));
    let b = Cons(3, Rc::clone(&a));
    println!("count after creating b = {}", Rc::strong_count(&a));
    {
        let c = Cons(4, Rc::clone(&a));
        println!("count after creating c = {}", Rc::strong_count(&a));
        {
            let d = Cons(5, Rc::clone(&a));
            println!("count after creating d = {}", Rc::strong_count(&a));
            }
        println!("count after d goes out of scope = {}", Rc::strong_count(&a));
    }
    println!("count after c goes out of scope = {}", Rc::strong_count(&a));

    let x = Cons(100, Rc::clone(&a));
    println!("count after creating x = {}", Rc::strong_count(&a));
}
```

```
A. 1
B. 2
C. 3
D. 4
E. 5
```



4. Can you create a memory leak in Rust?
```
A. True
B. False
```

    
