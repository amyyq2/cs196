use structopt::StructOpt;
use std::path::PathBuf;

#[derive(Debug, StructOpt)]
#[structopt(name = "opts", about = "")]
pub struct Opts {
    #[structopt(short = "l")]
    l: bool,
    #[structopt(short = "h")]
    h: bool,
    #[structopt(short = "a")]
    a: bool,
    #[structopt(parse(from_os_str))]
    directory: Option<PathBuf>,
}

fn main() {
    let opt = Opts::from_args();
    println!("{:?}", opt);
}
