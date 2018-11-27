#[derive(Debug)]
#[allow(dead_code)]
pub struct Parameter {
  pub label: String,
  pub name: String,
  pub kind: String
}

#[derive(Debug)]
#[allow(dead_code)]
pub enum Expression {
  Integer { value: i32 },
  Boolean { value: bool },
  Prototype { name: String, parameters: Vec<Parameter>, returns: Vec<String> }
}