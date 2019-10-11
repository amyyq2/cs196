use std::env;
use std::path::PathBuf;
use std::fs;
use super::opts::Opts;
use std::vec::Vec;
use std::fs::ReadDir;
use std::collections::HashMap;
use std::io::{Error, ErrorKind};

use crate::lib::list_item;

// Gets the current directory of the user
pub fn get_current_directory() -> PathBuf {
    let path = env::current_dir();
    match path {
        Ok(p) => return p,
        Err(e) => panic!(e)
    }
}

// Reads the contents of the current directory
pub fn get_directory_contents(directory: &PathBuf) -> Result<ReadDir, Error> {
   let paths = fs::read_dir(directory);
   match paths {
       Ok(p) => Ok(p),
       Err(e) => Err(e)
   }
}

// Prints similar output to what ls does in bash
pub fn print_ls(items: Vec<list_item::ListItem>) {
}

// Prints the extra file details similar to ls -l and ls -lh
pub fn print_ls_extra(items: Vec<list_item::ListItem>) {
}

// Determines what information we are going to want to print out
pub fn print_items(items: Vec<list_item::ListItem>, is_human: bool, is_long: bool) {
}

// Uses the command line arguments to figure out what to print in response.
pub fn exec_ls(args: Opts) {
}
