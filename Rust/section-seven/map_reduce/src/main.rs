use std::fs;
use std::thread;

fn main() {

    // Get data into string
    let data = match fs::read_to_string("enlightenment.txt"){
        Ok(v) => v,
        Err(e) => {
            println!("{}", e);
            "yee haw".to_string()
        }
    };
    
    // Map phase
    let mut children = vec![];
    let mut chunked_data: Vec<String> = Vec::new(); 
    for item in data.split_ascii_whitespace() {
        chunked_data.push(item.to_string());
    }

    for data_segment in chunked_data {
        // @TODO What do we do in here with threads ?
    }

    let mut word_tokens = vec![];
    for child in children {
        let token = // @TODO What do we do here with threads ? 
        word_tokens.push(token);
    }

    // Sort phase
    word_tokens.sort_by(|a, b| a.partial_cmp(&b).unwrap_or(std::cmp::Ordering::Equal));

    // Reduce phase
    let mut current_word = &word_tokens[0].0;
    let mut current_count = 0;
    for pair in &word_tokens {
        if current_word == &pair.0 {
            current_count += pair.1;
        }
        else {
            if !current_word.is_empty() {
                println!("{},{}", current_word, current_count);
            }
            current_word = &pair.0;
            current_count = pair.1;
        }
    }
    if !current_word.is_empty() {
        println!("{},{}", current_word, current_count);
    }
}

