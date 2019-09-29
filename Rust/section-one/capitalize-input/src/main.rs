use std::io;
//use std::io::prelude::*;

// Echoes the input like so
// You entered hello world
// DOES NOT RETURN ANYTHING
fn echo_input(param_name: String) {
    println!("You entered {}", param_name);
}

// Changes the input data to be uppercase
// Look at std::string::String for help
// DOES NOT RETURN ANYTHING
fn uppercase(param: String) {
    println!("{}", param.to_uppercase());
}

// Reads standard input and uppercases the input
fn main() {
    let mut input = String:: new();
    match io::stdin().read_line(&mut input) {
	Ok(_) => {
	    let input2 = input.clone();
	    echo_input(input);
	    uppercase(input2);
	},
	Err(error) => println!("error: {}", error)
    }
}
