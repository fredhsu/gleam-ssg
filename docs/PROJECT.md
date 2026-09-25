# Project compass

## The pitch

Build a small, typed static site generator as a way to learn Gleam. A site is a
set of source files and configuration; a build turns those inputs into a directory
of files that any ordinary web server can serve.

The generator is successful when you trust it on a small personal site and can
explain every important design decision. Feature count is not the score.

## A concrete target

Use this example shape as the first contract:

```text
example/
├── content/
│   ├── index.md
│   └── notes/hello.md
├── static/
│   └── style.css
└── _site/                 # generated; safe to replace
    ├── index.html
    ├── notes/hello/index.html
    └── style.css
```

Each Markdown page may have a small metadata header containing a title and,
later, tags or a date. The first layout can be a Gleam function; external template
syntax is a later decision, not a prerequisite.

## The architectural hunch

Keep the center of the program boring and pure:

```text
source text -> decoded page -> rendered body -> laid-out HTML -> output plan
```

Put effects at the edges:

```text
filesystem -> discover/read -> PURE CORE -> mkdir/write/copy -> filesystem
terminal   -> parse command -> PURE CORE -> report result    -> terminal
```

Useful early concepts—not prescribed final APIs—are:

- `Page(metadata, body, source_path)` for valid content;
- `Route` for a validated output location, rather than a loose string;
- `BuildError` variants that preserve where and why a build failed;
- `Output` values describing writes before they happen; and
- small transformation functions that compose into a visible pipeline.

This is the YOCaml-inspired part: describe meaningful transformations and keep
effects explicit. Do not begin by recreating a generalized arrow framework. Earn
that abstraction after two or three concrete pipelines reveal duplication.

## Product questions worth owning

These are the interesting SSG decisions. Resist outsourcing them accidentally to
a library:

1. How does a source path map to a URL and output path?
2. What metadata is required, optional, or unknown?
3. Can two sources claim the same route, and how is that reported?
4. What exactly makes an output stale?
5. Does a layout change invalidate every page that uses it?
6. Which errors stop the build, and which become warnings?
7. How deterministic is a build?

## Boundaries and non-goals

For the core trail:

- target the Erlang runtime first;
- support one content root and one output root;
- support Markdown pages and copied static files;
- keep configuration in code or use tiny defaults;
- rebuild sequentially; and
- generate HTML, not a live web application.

Do not initially build a CMS, theme marketplace, arbitrary plugin system,
JavaScript bundler, image pipeline, deployment platform, or universal template
language. Each could be a later expedition.

## Dependency policy

Choose a package when it solves a well-specified commodity concern such as file
access, Markdown parsing, or command-line parsing. Wrap it behind a small adapter
you own. This keeps the learning centered on data modeling and build behavior,
while making package experiments reversible.

Current packages worth evaluating—not automatically installing—include
[simplifile](https://simplifile.hexdocs.pm/) for synchronous filesystem work,
[mork](https://hex.pm/packages/mork) for Markdown, and
[glint](https://hexdocs.pm/glint/) for a CLI. Check their current APIs when you
reach the relevant module.

## What “done” looks like

The core project is done when:

- a clean checkout can build the example site with one documented command;
- repeated builds have deterministic output;
- invalid metadata and route collisions produce actionable messages;
- core path, decoding, and planning rules have focused tests;
- changing content rebuilds the right page;
- changing a shared layout rebuilds its dependants; and
- the README explains constraints honestly.

Anything after that is a new season, not unfinished homework.

