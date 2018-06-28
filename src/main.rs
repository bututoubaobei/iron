#[macro_use]
extern crate clap;

mod iron;
use clap::App;
use clap::Arg;
use clap::AppSettings;
use iron::token::Token as Token;

fn main() {
    let matches = App::new("iron")
        .version(crate_version!())
        .global_setting(AppSettings::ColoredHelp)
        .about("Compiler and package manager for the Iron programming language.")
        .author("Sam Jackson <sam@clique.app>")
        .arg(Arg::with_name("INPUT")
            .help("Path for Iron source file.")
            .required(true)
            .index(1))
        .get_matches();

    // Calling .unwrap() is safe here because "INPUT" is required (if "INPUT" wasn't
    // required we could have used an 'if let' to conditionally get the value)
    //
    // From: https://docs.rs/clap/2.32.0/clap/
    let source = matches.value_of("INPUT").unwrap();
    let tokens: Vec<Token> = iron::lexer::tokens_from_path(source);

    for token in tokens {
        println!("{:?}", token);
    }
}
