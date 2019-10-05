use serde::{Deserialize, Serialize};
use std::env;
use std::fs::File;
use std::io::Read;
extern crate serde;
#[derive(Serialize, Deserialize, Debug)]
struct TA {
    name: String,
    location: String,
    age: i32,
}

#[derive(Serialize, Deserialize, Debug)]
struct Person {
    course_staff: Vec<TA>
}
fn main() {
    let avgAge: i32;
    let mut ageSum: i32=0;
    let args: Vec<String> = env::args().collect();
    let json = &args[1];
    let input = &args[2];
    let mut contents= String::new();
    let mut file = File::open(json).unwrap();
    file.read_to_string(&mut contents).unwrap();
    let person: Person = serde_json::from_str(&contents).unwrap();
    let num = person.course_staff.len() as i32;
    if input == "bay" {
	for TA in &person.course_staff {
	    if (TA.location == "BAY_AREA") {
		println!("{}", TA.name);
	    }
	}
    } else if input == "age" {
	for TA in &person.course_staff {
	    ageSum = ageSum + TA.age;
	}
	avgAge = ageSum/num;
	println!("{}", avgAge);
    } else {
	println!("extra");
    }

}
