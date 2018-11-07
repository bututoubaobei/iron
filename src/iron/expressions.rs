pub struct IntegerExpression {
  value: i32
}

pub struct BooleanExpression {
  pub value: bool
}

pub struct PrototypeExpression {
  pub name: &'static str,
  pub parameters: Vec<(&'static str, &'static str)>,
  pub returns: Vec<&'static str>,
}