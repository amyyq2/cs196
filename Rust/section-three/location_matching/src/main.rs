#[derive(Debug)]
struct TA_container {
    course_staff: Vec<TA>
}
#[derive(Debug)]
struct TA {
    name: String,
    location: Location,
}

#[derive(Debug)]
enum Location {
    BAY_AREA,
    NAPERVILLE,
    NEW_JERSEY,
}

fn main() {
    let mut staff = Vec::new();
    staff.push( TA {name: "Zach".to_string(), location: Location::NEW_JERSEY} );
    staff.push( TA {name: "Yash".to_string(), location: Location::BAY_AREA} );
    staff.push( TA {name: "Jatin".to_string(), location: Location::NAPERVILLE} );
    staff.push( TA {name: "Melissa".to_string(), location: Location::NAPERVILLE} );
    staff.push( TA {name: "Peter".to_string(), location: Location::BAY_AREA} );
    staff.push( TA {name: "Clara".to_string(), location: Location::BAY_AREA} );
    staff.push( TA {name: "Zac".to_string(), location: Location::NEW_JERSEY} );
    staff.push( TA {name: "Jackie".to_string(), location: Location::NAPERVILLE} );
    staff.push( TA {name: "Rishi".to_string(), location: Location::BAY_AREA} );
    println!("BAY_AREA");
    for teacher in &staff {
	match &teacher.location {	
	    Location::BAY_AREA => println!("{}", teacher.name),
	    Location::NAPERVILLE => print!(""),
	    Location::NEW_JERSEY => print!(""),
	}
    }
    println!("NAPERVILLE");
    for teacher in &staff {
	match &teacher.location {
	    Location::BAY_AREA => print!(""),
	    Location::NAPERVILLE => println!("{}", teacher.name),
	    Location::NEW_JERSEY => print!(""),
	}
    }
    println!("NEW_JERSEY");
    for teacher in &staff {
	match &teacher.location {
	    Location::BAY_AREA => print!(""),
	    Location::NAPERVILLE => print!(""),
	    Location::NEW_JERSEY => println!("{}", teacher.name),
	}
    }
}
