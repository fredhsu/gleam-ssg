# Module 8 — Build the conveyor belt

**Time:** 50–80 minutes
**Unlocks:** a visible, composable build pipeline

## Mission

Make the page-building stages first-class enough to compose, test, and inspect.
This is the strongest YOCaml-inspired module: transformations become the vocabulary
of the build rather than being buried in one large command.

## Inventory before abstraction

Write the concrete stages you already have:

```text
source text
  -> front matter + body
  -> validated page
  -> rendered article
  -> laid-out document
  -> planned output
```

Mark each stage pure/fallible/effectful. If two adjacent stages have the same useful
shape, there may be a combinator waiting to be named.

## Main quest

- [ ] Give every existing stage a focused function and meaningful input/output.
- [ ] Compose fallible pure stages with the ordinary `Result` tools first.
- [ ] Make the top-level page pipeline readable from left to right.
- [ ] Keep reading and writing outside that transformation.
- [ ] Test the whole pure pipeline with an in-memory fixture.
- [ ] Add stage context to an error without flattening it into a vague string.

## Abstraction checkpoint

Only now ask whether a custom `Pipeline(input, output)` type buys something.
Possible benefits include a shared context, dependency recording, or stage tracing.
“It resembles YOCaml” is not sufficient. Record the concrete pressure either way.

## Boss fight: tracing

Without changing the output, make a debug mode report completed stage names. Try a
simple explicit wrapper before changing every function signature.

## Victory condition

A reader can identify the build stages from the orchestrating function, each pure
stage is testable alone, and no generalized abstraction exists without a stated job.

## Stretch quest

Sketch—not necessarily implement—a typed transformation that carries dependencies
beside its value. Revisit the sketch in Module 11.

## Trail marker

Finish this sentence: “Composition became awkward when …” or “Plain functions are
still enough because …”

