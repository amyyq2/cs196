Please fill out the text file and submit it via Git like so 

```
1. A
2. B
3. C
4. D
5. A
```

1. Does rust use green threads by default ? 

```
A. True
B. False
```



2. Can you use green threads in Rust ?

```
A. True
B. False
```

    

3. What are the is the receiver in the code ? 

```Rust
use std::thread;
use std::sync::mpsc;
use std::time::Duration;

fn main() {
    let (tx, rx) = mpsc::channel();

    thread::spawn(move || {
	let vals = vec![
	    String::from("hi"),
	    String::from("from"),
	    String::from("the"),
	    String::from("thread"),
	];

	for val in vals {
	    tx.send(val).unwrap();
	    thread::sleep(Duration::from_secs(1));
	}
    });
    
    for received in rx {
	println!("Got: {}", received);
    }
}
```

```
A. tx
B. rx
C. vals
D. mpsc
```

    
