use std::ops::{Add, Mul};
use std::fmt::{Formatter, Result, Display};

// May need to add to this as well !
#[derive(Debug, Copy, Clone)]
struct Vector<T> {
    x: T,
    y: T,
    z: T
}

// Implement the Add trait for Vector
impl<T> Add for Vector::<T> where T:Add<Output=T> + Copy + Clone {
    type Output = Vector<T>;

    fn add(self, rhs: Self) -> Self::Output {
        Self {
            x: (self.x + rhs.x),
            y: (self.y + rhs.y),
            z: (self.z + rhs.z),
        }
    }
}
// Implement the Mul trait for Vector
impl<T> Mul for Vector::<T> where T:Mul<Output=T> + Copy + Clone {
    type Output = Vector<T>;
    fn mul(self, rhs: Self) -> Self::Output {
	Self {
	    x: (self.x * rhs.x),
	    y: (self.y * rhs.y),
	    z: (self.z * rhs.z),
	}
    }
}

// Implement the Display trait for Vector  such that the output looks like
// (1, 2, 3)
impl<T> Display for Vector::<T> where T: Display + Copy + Clone {
    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
	write!(f, "({}, {}, {})", self.x, self.y, self.z)
    }
}
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
