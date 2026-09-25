import gleam/io
import gleam/list
import gleam/string

pub fn greeting(name) -> String {
  "Hello " <> name <> "!"
}

pub fn markdown_h1(header) -> String {
  "# " <> header
}

pub fn htmldoc(doc: String) -> String {
  "<html>\n" <> doc <> "\n</html>"
}

pub fn title(s: String) -> String {
  "<title>\n" <> s <> "\n</title>\n"
}

pub fn body(s: String) -> String {
  "<body>\n" <> markdown_to_html(s) <> "\n</body>"
}

pub fn markdown_line_to_html(md: String) -> String {
  // for now just pass <, >, & through unchanged
  case md {
    "# " <> h -> "<h1>" <> h <> "</h1>"
    "## " <> h -> "<h2>" <> h <> "</h2>"
    "### " <> h -> "<h3>" <> h <> "</h3>"
    // Blank lines are preserved as empty output lines
    "" -> ""
    _ -> "<p>" <> md <> "</p>"
  }
}

pub fn markdown_to_html(m: String) -> String {
  m
  |> string.split(on: "\n")
  |> list.map(fn(line) { markdown_line_to_html(line) })
  |> string.join(with: "\n")
}

pub fn main() -> Nil {
  io.println(greeting("Fred"))
  io.println(markdown_h1("Fred"))
  io.println(markdown_line_to_html("# test"))
  io.println(markdown_to_html("# this is\nmore lines"))
  let html_title = title("this is the title")
  let html_body = body("# this is the body\nand the text")
  let html_doc = htmldoc(html_title <> html_body)
  io.println(html_doc)
  io.println(markdown_to_html("<script>"))
}
