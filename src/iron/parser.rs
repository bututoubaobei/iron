use iron::expressions::{ BooleanExpression, PrototypeExpression };

pub fn hello() {
    let test: BooleanExpression = BooleanExpression { value: true };

    let name = "hello";
    let parameters = vec![("a", "apple"), ("b", "orange")];
    let returns = vec!["int", "bool"];

    let p: PrototypeExpression = PrototypeExpression { name, parameters, returns };

    if test.value {
        println!("The boolean expression is true!");
    } else {
        println!("The boolean expression is false.");
    }

    println!("Function {} has {} arguments and returns {} values.",
        p.name,
        p.parameters.len(),
        p.returns.len()
    );
}

// Parses a let expression based on the definition in our grammar.
//
// ```
// <LetExpression>
//   := let VARIABLE_NAME = VARIABLE_VALUE;
//   || let VARIABLE_NAME: VARIABLE_TYPE = VARIABLE_VALUE;
// ```
// fn parse_let_expression(index: &mut usize, tokens: &Vec<Token>) {
//     let mut variable_type: Type;
//     let mut variable_name: String;
//     let mut variable_value: String;
//     *index += 1; // Consume "let" keyword.

//     // Set variable identifier.
//     match &tokens[*index] {
//         Token::Identifier(value) => {
//             variable_name = value.clone();
//             *index += 1; // Consume.
//         },
//         _ => panic!("Expected identifier in let expression.")
//     }

//     // Set variable type.
//     match &tokens[*index] {
//         Token::OfTypeIndicator => {
//             *index += 1;
//             match &tokens[*index] {
//                 Token::Identifier(value) => {
//                     match value as &str {
//                         "Integer" => variable_type = Type::Integer,
//                         "Float" => variable_type = Type::Float,
//                         "String" => variable_type = Type::String,
//                         "Boolean" => variable_type = Type::Boolean,
//                         "Function" => variable_type = Type::Function,
//                         "Module" => variable_type = Type::Module,
//                         _ => panic!("Expected valid type")
//                     }
//                     *index += 1;
//                 },
//                 _ => panic!("Expected type in let expression.")
//             }
//         },
//         _ => panic!("Expected type indicator (`:`) in let expression.")
//     }

//     // Set variable value.
//     match &tokens[*index] {
//         Token::Equals => {
//             *index += 1;
//             match &tokens[*index] {
//                 Token::Identifier(value) => {
//                     variable_value = value.clone();
//                     *index += 1;
//                 },
//                 _ => panic!("Expected expression")
//             }
//         }
//         _ => panic!("Expected `=` in let expression.")
//     }

//     // let result = Expression::LetExpression {
//     //     variable_name: variable_name,
//     //     variable_type: variable_type
//     // };

//     println!("Parsed let expression.");
// }

// Parses an if-else block based on the definition in our grammar.
//
// ```
// ```
// fn parse_if_else_block(index: &mut usize, tokens: &Vec<Token>) {
//     // TODO
//     println!("Parsed if-else expression.");
// }

// Parses a function based on the definition in our grammar.
//
// ```
// <Function>
//   := function FUNCTION_NAME () { <ExpressionList> }
//   || function FUNCTION_NAME () -> RETURN_TYPE { <ExpressionList> }
//   || function FUNCTION_NAME (<ArgumentList>) { <ExpressionList> }
//   || function FUNCTION_NAME (<ArgumentList>) -> RETURN_TYPE
//        { <ExpressionList> }
// ```
// fn parse_function(index: &mut usize, tokens: &Vec<Token>) {
//     // TODO
//     println!("Parsed function.");
// }

// Parses a type based on the definition in our grammar.
//
// ```
// ```
// fn parse_type_definition(index: &mut usize, tokens: &Vec<Token>) {
//     // TODO
//     println!("Parsed type defintion");
// }

// The driver of our parser iterates through a vector of tokens and calls the appropriate
// expression handler function (parse_*). The result is a vector of expression objects that
// contain contextual information regarding the Iron program to be compiled.
//
// # Examples
//
// ```
// let expressions: Vec<Expression> = iron::parser::parse_tokens(&tokens);
// ```
// pub fn parse_tokens(tokens: &Vec<Token>) {
//     let mut index = 0;

//     while index < tokens.len() {
//         match &tokens[index] {
//             Token::Identifier(value) => {
//                 match value as &str {
//                     "type" => parse_type_definition(&mut index, &tokens),
//                     "let" => parse_let_expression(&mut index, &tokens),
//                     "function" => parse_function(&mut index, &tokens),
//                     "if" => parse_if_else_block(&mut index, &tokens),
//                     _ => println!("Nothing")
//                 }
//             },
//             _ => println!("Not an identifier")
//         }

//         index += 1;
//     }
// }
