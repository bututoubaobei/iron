#[allow(dead_code)]
pub enum Expression {
  Integer { value: i32 },
  Boolean { value: bool },
  Prototype { name: &'static str, parameters: Vec<(&'static str, &'static str)>, returns: Vec<&'static str> }
}