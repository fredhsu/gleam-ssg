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

pub fn markdown_test() {
  assert pika.markdown_h1("Fred") == "# Fred"
}

pub fn markdown_line_to_html_test() {
  assert pika.markdown_line_to_html(pika.markdown_h1("test")) == "<h1>test</h1>"
  assert pika.markdown_line_to_html("## test2") == "<h2>test2</h2>"
  assert pika.markdown_line_to_html("### test3") == "<h3>test3</h3>"
  assert pika.markdown_to_html("# this is\nmore lines")
    == "<h1>this is</h1>\n<p>more lines</p>"
  assert pika.markdown_to_html("") == ""
  assert pika.markdown_to_html("\n\n") == "\n\n"
}
