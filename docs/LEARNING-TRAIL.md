# Learning trail

The core trail is fourteen small modules. Do them in order through Module 8; after
that, take detours freely. Each main quest aims for roughly 30–75 focused minutes.

| Stop | Module | Artifact | Main idea |
|---:|---|---|---|
| 0 | [Basecamp](modules/00-basecamp.md) | Running package | Gleam workflow |
| 1 | [First spark](modules/01-first-spark.md) | One HTML string | Pure transformation |
| 2 | [Page passport](modules/02-page-passport.md) | Typed page model | Custom types and `Result` |
| 3 | [Touch the filesystem](modules/03-filesystem-boundary.md) | One generated file | Effects at the boundary |
| 4 | [Draw the route map](modules/04-routing.md) | Safe source-to-output rules | Paths and invariants |
| 5 | [Read the label](modules/05-front-matter.md) | Typed metadata | Parsing and validation |
| 6 | [Invite Markdown](modules/06-markdown.md) | Rendered article body | Adapters and package evaluation |
| 7 | [Dress the page](modules/07-layouts.md) | Complete HTML document | Layout composition and escaping |
| 8 | [Build the conveyor belt](modules/08-pipeline.md) | Composed page pipeline | YOCaml-inspired transformations |
| 9 | [Open the workshop](modules/09-many-pages-assets.md) | Multi-page site | Discovery, planning, copying |
| 10 | [Make a gathering](modules/10-collections.md) | Index or tag page | Aggregation and ordering |
| 11 | [Teach it memory](modules/11-incremental-builds.md) | Selective rebuilds | Dependencies and freshness |
| 12 | [Give it a front door](modules/12-cli.md) | Friendly `build` command | CLI design and error UX |
| 13 | [Ship the tiny forge](modules/13-capstone.md) | Documented v0.1 | Integration and reflection |

## Trail map

```text
0 -> 1 -> 2 -> 3 -> 4 -> 5 -> 6 -> 7 -> 8 -> 9 -> 10 -> 11 -> 12 -> 13
                         |              |         |      |
                         + fixtures     + feeds   + watch+ preview
```

The side paths are deliberately not modules yet. Add them only if the core tool
makes you curious about them.

## Milestones

- **First light (0–3):** one input becomes one real file.
- **A tiny site (4–9):** several pages and assets land at predictable URLs.
- **A useful tool (10–13):** global pages, incremental work, CLI polish, v0.1.

At each milestone, build the example site from scratch and keep one artifact—a
screenshot, build transcript, or short note. These make progress visible when the
middle of the project feels foggy.

## Coach commands

These are useful ways to ask for help without surrendering the exercise:

- “Quiz me on the design choices in Module 4.”
- “Review this type model; ask questions before suggesting changes.”
- “Give me the first hint only for the current checkpoint.”
- “Invent three nasty inputs for this parser.”
- “Explain this compiler error, but let me propose the fix.”
- “Review my module against its victory condition.”

