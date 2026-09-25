# Module 4 — Draw the route map

**Time:** 45–70 minutes
**Unlocks:** predictable, safe URLs

## Mission

Turn relative content paths into explicit routes and output paths. Routing looks
like string manipulation until collisions, indexes, and traversal make it a domain
problem.

## Write the table first

Complete or change this table before implementing:

| Source | Public URL | Output path |
|---|---|---|
| `index.md` | `/` | `index.html` |
| `about.md` | `/about/` | `about/index.html` |
| `notes/hello.md` | `/notes/hello/` | `notes/hello/index.html` |

Decide what `notes/index.md`, uppercase extensions, spaces, hidden files, and
non-Markdown files mean. “Unsupported for now” is a valid explicit answer.

## Main quest

- [ ] Model a route separately from its source path.
- [ ] Implement source-relative-path to route as a pure function.
- [ ] Render a route to both public URL and output-relative path.
- [ ] Reject absolute paths and parent traversal.
- [ ] Test the table plus at least two rejected paths.
- [ ] Update the one-file build to use the computed output.

## Boss fight: collision

Find two source naming rules that might claim the same output. Make a list of
planned outputs and reject duplicates *before* writing any file. The error should
name both sources and the contested route.

## Questions to earn the checkpoint

- Which invariants belong in the `Route` constructor?
- Should URLs know the output root? Why or why not?
- At what stage can collision detection see enough information?

## Victory condition

Routing is covered by table-driven examples, output paths cannot escape their root,
and conflicts are detected during planning rather than halfway through execution.

## Stretch quest

Add a `pretty_urls` policy value rather than a Boolean. Sketch a second policy and
notice whether the model stays readable.

## Trail marker

Record one route rule you expect future-you to forget.

