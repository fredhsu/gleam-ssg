# The Tiny Gleam Site Forge

This repository is a learning trail for building a small static site generator in
Gleam. The working title is deliberately temporary: naming the tool is one of the
rewards for getting it to generate its first real site.

The aim is not to receive a finished generator. It is to discover one, one small
vertical slice at a time. Each module should fit into a spare evening or a good
coffee break, leave the program in a working state, and produce something you can
see or test.

## Start here

1. Read [the project compass](docs/PROJECT.md) to see what we are building and
   what we are intentionally leaving out.
2. Pick a session style in [the learning method](docs/METHOD.md).
3. Open [the learning trail](docs/LEARNING-TRAIL.md) and begin at Basecamp.
4. Keep [the field notes](docs/FIELD-NOTES.md) open while you work.

The trail borrows ideas from YOCaml—small composable transformations, explicit
effects, and dependency-aware builds—without trying to port YOCaml or copy its
abstractions before we understand why they help. See
[the source notes](docs/research/yocaml-architecture.md) for the researched background.

## The tiny-site promise

At the end of the core trail, the tool should be able to:

- discover Markdown pages in a content directory;
- decode typed front matter with useful errors;
- turn content into HTML through a layout;
- copy static assets and generate collection pages;
- avoid rebuilding outputs whose inputs have not changed; and
- expose a friendly command-line build command.

Preview serving, file watching, feeds, deployment, and plugins are bonus country.

## Ground rules

- Make the smallest thing visible before making it general.
- Keep pure transformations separate from filesystem and terminal effects.
- Use dependencies for commodity problems; write the SSG decisions yourself.
- A red test with a lesson in it counts as progress.
- Stop at a checkpoint. Side projects survive by leaving an inviting next step.

No generated site code lives here yet. That is your first move.
