# Module 1 — First spark

**Time:** 25–45 minutes
**Unlocks:** one visible HTML transformation

## Mission

Turn a hard-coded piece of content into a tiny HTML fragment using a pure
function. Do not read or write files yet.

## Design prompt

Sketch a signature for a function that receives plain content and returns HTML.
What can fail today? If the honest answer is “nothing,” do not add `Result` yet.

## Main quest

- [ ] Choose a deliberately tiny input convention: for example, one title line
      and one paragraph—not Markdown as a whole.
- [ ] Implement only enough transformation to render that example.
- [ ] Print the result from `main`.
- [ ] Add tests for ordinary text and empty text.
- [ ] Decide what happens to `<`, `>`, and `&`; record the choice even if support
      comes later.

The deliberately fake mini-format lets you practice string and list operations
without hiding the pipeline inside a Markdown package. Throw it away in Module 6.

## Weird-input card

Draw one: an empty title, two blank lines, an emoji, or text containing `<script>`.
Predict behavior, run it, and note the mismatch.

## Questions to earn the checkpoint

1. Which part of the function is parsing, and which part is rendering?
2. Would a list of lines or one string make the next rule clearer?
3. Is HTML escaping the parser's responsibility or the renderer's?

## Victory condition

`main` prints a recognizable HTML fragment, tests describe the tiny format, and
the transformation has no filesystem or terminal calls inside it.

## Stretch quest

Generate a complete HTML document with a title and body, but resist adding a
general template abstraction. This is a sketch you will improve later.

## Trail marker

Write down which unstructured values now travel together and may deserve a type.

