use iron::token::Token;
use iron::expressions::Expression;

#[allow(dead_code)]
pub fn hello() {
    let test: Expression = Expression::Boolean { value: true };

    let name = "hello";
    let parameters = vec![("a", "apple"), ("b", "orange")];
    let returns = vec!["int", "bool"];

    let p: Expression = Expression::Prototype { name, parameters, returns };

    match test {
        Expression::Boolean { value } => println!("The test is {}!", value),
        _ => panic!()
    }

    match p {
        Expression::Prototype { name, parameters, returns } => {
            println!("Function {} has {} arguments and returns {} values.",
                name,
                parameters.len(),
                returns.len()
            );
        },
        _ => panic!()
    }
}

#[allow(dead_code)]
pub fn parse(_: Vec<Token>) -> Vec<Expression> {
    let result: Vec<Expression> = Vec::new();
    return result;
}