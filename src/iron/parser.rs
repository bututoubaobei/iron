use iron::token::Token;
use iron::expression::Parameter;
use iron::expression::Expression;

struct ParserError {
    message: String
}

#[allow(dead_code)]
pub fn hello() {
    println!("Hello from the parser!");
}

#[allow(dead_code)]
pub fn parse(tokens: Vec<Token>) -> Vec<Expression> {
    let index: usize = 0;
    let mut_tokens = &mut tokens.clone();
    let mut _result: Vec<Expression> = Vec::new();

    while mut_tokens[index] != Token::EndOfFile {
        match mut_tokens[index] {
            Token::Function => {
                match parse_prototype(mut_tokens) {
                    Ok(expr) => println!("{:?}", expr),
                    Err(err) => panic!("Error while parsing function: {}", err.message)
                }
            },
            _ => panic!("END")
        }
    }

    return _result;
}

fn parse_prototype(tokens: &mut Vec<Token>) -> Result<Expression, ParserError> {

    // Consume the `function` keyword.
    match tokens.remove(0) {
        Token::Function => (),
        _ => panic!("Expected `function`")
    }

    // Retrieve the function name.
    match tokens.remove(0) {
        Token::Identifier(name) => {
            match tokens.remove(0) {
                Token::OpenParen => {
                    let parameters: Vec<Parameter> = parse_parameter_list(tokens);

                    return Ok(Expression::Prototype {
                        name,
                        parameters,
                        returns: vec![]
                    });
                },
                Token::OpenBrace => return Ok(Expression::Prototype {
                    name, parameters: vec![], returns: vec![] }),
                _ => panic!("Expected `(` or `{` while parsing function.")
            }
        },
        _ => panic!("Expected identifier while parsing function.")
    }
}

fn parse_parameter_list(tokens: &mut Vec<Token>) -> Vec<Parameter> {
    let front: usize = 0;
    let mut parameters: Vec<Parameter> = Vec::new();

    while tokens[front] != Token::CloseParen {
        match parse_parameter(tokens) {
            Ok(param) => parameters.push(param),
            Err(err) => panic!(err.message)
        }

        if tokens[front] == Token::Comma {
            tokens.remove(0); // Consume parameter separator
        }
    }

    tokens.remove(0); // Consume closing paren.

    return parameters;
}

fn parse_parameter(tokens: &mut Vec<Token>) -> Result<Parameter, ParserError> {
    let label: String;
    let name: String;
    let kind: String;

    match tokens.remove(0) {
        Token::Identifier(l) => label = l,
        _ => panic!("Expected label while parsing parameter")
    }

    match tokens.remove(0) {
        Token::Identifier(n) => name = n,
        _ => panic!("Expected variable name while parsing parameter")
    }

    match tokens.remove(0) {
        Token::OfTypeIndicator => {
            match tokens.remove(0) {
                Token::Identifier(k) => kind = k,
                _ => panic!("Expected type while parsing parameter")
            }
        },
        _ => panic!("Expected `:` while parsing parameter")
    }

    Ok(Parameter { label, name, kind })
}