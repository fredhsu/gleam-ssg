# Module 0 — Basecamp

**Time:** 20–40 minutes
**Unlocks:** a runnable, testable Gleam package

## Mission

Create the smallest conventional Gleam project in this repository. Learn the
build–run–test loop before the generator has any generator-shaped code.

## Before touching the keyboard

Predict which files `gleam new` will create and which one contains the executable
entry point. Then check the [official CLI reference](https://gleam.run/documentation/command-line-reference/)
only after writing the prediction.

## Main quest

- [x] Confirm `gleam --version` works.
- [x] Initialize a package without replacing these learning notes or the existing
      Git repository. Inspect command options before running it.
- [x] Run the generated program.
- [x] Run the generated tests.
- [x] Change the greeting to identify the project as a tiny site forge.
- [x] Make one test fail on purpose, read the output, then restore it.

The command line supports both Erlang and JavaScript targets. Choose Erlang for
the first trail and record that as a reversible decision; CLI filesystem tooling
is the immediate goal, not cross-target portability.

## Notice

- Where does Gleam expect source and test modules?
- What is the type of `main`?
- How does a pipeline read compared with nested function calls?
- What information does the compiler give before the tests run?

## Pocket challenge

Add a pure function that returns the greeting and make `main` print it. Test the
pure function. This tiny separation previews the core/effects boundary used later.

## Victory condition

From a clean terminal, you can run one command to execute the program and one to
run the tests. Both succeed, and you can explain what each generated file is for.

## Stretch quest

Complete a few sections of the interactive [Gleam language tour](https://tour.gleam.run/)
on custom types, pattern matching, `Result`, and pipelines. Stop when those ideas
feel recognizable; the project will supply the repetition.

## Trail marker

Write the exact next action: “replace the greeting input with a Markdown string.”
