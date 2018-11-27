#[macro_use]
extern crate clap;

mod iron;
use clap::App;
use clap::Arg;
use clap::AppSettings;
use iron::token::Token;

fn main() {
    let matches = App::new("iron")
        .version(crate_version!())
        .global_setting(AppSettings::ColoredHelp)
        .about("Compiler and package manager for the Iron programming language.")
        .author("Sam Jackson <sam@roth.fyi>")
        .arg(Arg::with_name("INPUT")
            .help("Path for Iron source file.")
            .required(true)
            .index(1))
        .get_matches();

    // Fetch the input source file and proceed.
    if let Some(source) = matches.value_of("INPUT") {
        let _: Vec<Token> = iron::lexer::tokens_from_path(source);
    }

    iron::parser::hello();
}
