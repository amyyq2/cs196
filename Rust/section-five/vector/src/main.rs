use std::ops::{Add, Mul};
use std::fmt::{Formatter, Result, Display};

// May need to add to this as well !
#[derive(Debug)]
struct Vector<T> {
    x: T,
    y: T,
    z: T
}

// Implement the Add trait for Vector

// Implement the Mul trait for Vector

// Implement the Display trait for Vector  such that the output looks like
// (1, 2, 3)

fn main() {
    let a = Vector {
        x: 1,
        y: 2,
        z: 3
    };

    let b = Vector {
        x: 2,
        y: 4,
        z: 6
    };

    let y = Vector {
        x: 1.1,
        y: 2.2,
        z: 3.3
    };

    let x = Vector {
        x: 2.1,
        y: 4.2,
        z: 6.3
    };

    let addition = a + b;
    let multiplication = a * b;
    let float_addition = x + y;
    let float_multiplication = x * y;
    println!("{}", addition);
    println!("{}", multiplication);
    println!("{}", float_addition);
    println!("{}", float_multiplication);
}
