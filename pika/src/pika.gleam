import gleam/io

pub fn greeting(name) -> String {
    "Hello " <> name <> "!"
  }

pub fn main() -> Nil {
  io.println(greeting("Fred"))
}
