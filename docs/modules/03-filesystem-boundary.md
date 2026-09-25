# Module 3 — Touch the filesystem

**Time:** 35–60 minutes
**Unlocks:** the first generated file

## Mission

Read one source file, pass its text through the existing pure core, and write one
HTML file. This is the first full vertical slice.

## Package investigation

Inspect the current documentation for
[simplifile](https://simplifile.hexdocs.pm/) and Gleam's Erlang file APIs. Compare:
target support, error types, directory creation, and API size. Choose one for now
and record why. Do not build a filesystem abstraction merely to hide one function.

## Main quest

- [ ] Add one source fixture under an `example/` or test-fixture directory.
- [ ] Read it at the outer edge of the program.
- [ ] Convert library errors into one project-owned `BuildError` variant.
- [ ] Feed the successful text into the pure page transformation.
- [ ] Create the output directory if necessary and write `index.html`.
- [ ] Open the result in a browser or inspect it directly.

Keep the orchestration legible: read, decode, render, write. If one step fails,
return the error instead of continuing with a default that hides it.

## Safety checkpoint

Never make “clean output” mean “delete whatever path the caller supplied.” The
output root must be explicit and validated. Deletion is not needed in this module.

## Experiment

Make the input path wrong, then make the output unwritable. Do the errors identify
the operation and path? If not, enrich them at the boundary.

## Victory condition

One command transforms one checked-in source fixture into one generated HTML file.
Pure transformation tests need no filesystem.

## Stretch quest

Use a temporary directory in one integration test. Assert output content, not
internal helper calls.

## Trail marker

Celebrate the first artifact. Save a screenshot or paste the build transcript into
your field notes.

