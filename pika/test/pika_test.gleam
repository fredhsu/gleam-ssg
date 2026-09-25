import gleeunit
import pika

pub fn main() -> Nil {
  gleeunit.main()
}

// gleeunit test functions end in `_test`
pub fn hello_world_test() {
  let name = "Fred"
  let greeting = "Hello, " <> name <> "!"

  assert greeting == "Hello, Fred!"
}

pub fn greeting_test() {
    assert pika.greeting("Fred") == "Hello Fred!"
  }
