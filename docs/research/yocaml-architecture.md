# YOCaml architecture notes for a Gleam SSG

> Research snapshot: 2026-09-24. Sources are limited to YOCaml's official
> tutorial and repository, inspected at commit
> [`bb37027`](https://github.com/xhtmlboi/yocaml/tree/bb3702742410ea0c994cdf795d79a9bfffaf86b3).

YOCaml describes itself as a framework for *building* a static-site generator,
not as a generator with one prescribed content model. That distinction is the
most useful inspiration for this project: the Gleam program can grow into a
small toolkit of composable build operations while the learner's own site
remains the first and best client of that toolkit. The official repository's
[README](https://github.com/xhtmlboi/yocaml/blob/bb3702742410ea0c994cdf795d79a9bfffaf86b3/README.md)
and [key-concepts guide](https://yocaml.github.io/tutorial/key-concepts.html)
make this framing explicit.

## The architectural shape

At a high level, YOCaml separates four concerns:

1. A **task** describes a transformation, the effects needed to run it, and its
   known file dependencies.
2. An **action** attaches a task to an artifact such as an output file and
   decides whether work is needed.
3. A persistent **cache** remembers prior targets and dependencies so dynamic
   build decisions survive between runs.
4. A **runtime** interprets filesystem, process, logging, and other primitive
   effects for a particular environment.

This separation is visible both in the tutorial and in the public interfaces
for [`Task`](https://github.com/xhtmlboi/yocaml/blob/bb3702742410ea0c994cdf795d79a9bfffaf86b3/lib/core/task.mli),
[`Action`](https://github.com/xhtmlboi/yocaml/blob/bb3702742410ea0c994cdf795d79a9bfffaf86b3/lib/core/action.mli),
[`Cache`](https://github.com/xhtmlboi/yocaml/blob/bb3702742410ea0c994cdf795d79a9bfffaf86b3/lib/core/cache.mli),
and [`Eff`](https://github.com/xhtmlboi/yocaml/blob/bb3702742410ea0c994cdf795d79a9bfffaf86b3/lib/core/eff.mli).

A useful mental picture for the Gleam exercise is:

```text
source files ──> typed transformations ──> output artifacts
     │                    │                       │
     └──── dependencies ──┴──── build record ────┘
                              interpreted by
                         a filesystem/runtime layer
```

Do not begin by implementing all four layers. The architecture is valuable as
a direction of travel; a first vertical slice can read one file, transform it,
and write one file.

## Tasks, pipelines, and arrows

YOCaml's `Task` is conceptually a function from an input value to an effectful
output value plus a set of static dependencies. It is parameterized by both its
input and output types, which lets one task feed another. The task interface
calls this a strong profunctor and an Arrow, and its composition operations
merge dependency sets while sequencing transformations. The official
[task interface](https://github.com/xhtmlboi/yocaml/blob/bb3702742410ea0c994cdf795d79a9bfffaf86b3/lib/core/task.mli)
is the precise source; the
[key-concepts guide](https://yocaml.github.io/tutorial/key-concepts.html#parallelism-and-sequentiality)
explains why arrows enter the design.

YOCaml uses two styles together:

- Applicative composition (`let+`/`and+`) combines independent work and gathers
  dependencies from both branches.
- Arrow composition sequences work when the result of one step becomes the
  input of the next. In practice, `>>>` composes tasks and `>>|` follows a task
  with an ordinary function.

The interesting lesson is not the category-theory vocabulary. It is that the
pipeline description retains information about *what it depends on* instead of
collapsing immediately into an opaque IO function. That retained information
later powers selective rebuilding.

For the Gleam project, start with ordinary, named transformations and one small
pipeline abstraction only after repetition appears. Preserve three properties:

- transformations have explicit input and output types;
- composition preserves errors rather than hiding them;
- reading a file records that file as a dependency.

Parallel/applicative composition and a full Arrow API are excellent optional
late-game experiments, not prerequisites for generating the first page.

## Effects and runtimes

YOCaml programs normally produce `Yocaml.Eff.t` values. A runtime interprets
the user-defined effects that represent operations such as reading, writing,
checking modification times, hashing content, running commands, and logging.
This indirection lets the same build description run on Unix, Eio, a Git-backed
filesystem, or—in principle—the browser, and makes effectful code easier to
test. See the official
[runtime/effects explanation](https://yocaml.github.io/tutorial/key-concepts.html#runtime-and-effects)
and the effect constructors in
[`eff.mli`](https://github.com/xhtmlboi/yocaml/blob/bb3702742410ea0c994cdf795d79a9bfffaf86b3/lib/core/eff.mli).

For a learning-oriented Gleam version, copy the *boundary*, not necessarily the
mechanism. Keep filesystem and clock access out of Markdown, metadata, routing,
and template logic. An explicit runtime record or a narrow group of IO modules
can make tests deterministic without recreating an effect system. If supporting
both Erlang and JavaScript becomes a goal, that boundary will also identify the
small target-specific surface.

## Dependency tracking and incremental builds

YOCaml calls its goal **minimality**: re-run only the tasks needed to update a
target. A target is rebuilt if it is missing or if a static dependency is newer.
Changing one article can therefore rebuild one page, while changing a shared
layout can rebuild every page that uses it. The official
[minimality guide](https://yocaml.github.io/tutorial/key-concepts.html#minimality-and-dependencies)
walks through exactly this example.

It distinguishes:

- **Static dependencies**, known before executing the task: a source Markdown
  file or a named template.
- **Dynamic dependencies**, discovered while executing: for example, a source
  file that names further inputs.

Dynamic dependencies require persistent build information. YOCaml's cache is a
map keyed by target path; an entry stores a content hash, dependencies, and an
optional last-build timestamp. Actions restore the cache, thread it through the
build, then store it again. The public
[`Cache`](https://github.com/xhtmlboi/yocaml/blob/bb3702742410ea0c994cdf795d79a9bfffaf86b3/lib/core/cache.mli)
and
[`Action`](https://github.com/xhtmlboi/yocaml/blob/bb3702742410ea0c994cdf795d79a9bfffaf86b3/lib/core/action.mli)
interfaces document this representation and lifecycle.

An approachable Gleam progression is:

1. Always rebuild. Make correctness visible first.
2. Track source and template paths for each output and print a tiny build trace.
3. Skip an output when it exists and all dependencies are older.
4. Add a serialized cache only when dynamic dependencies or content hashes are
   genuinely useful.
5. Deliberately test deletion, renamed inputs, clock skew, and corrupted cache
   data before calling the incremental build finished.

This sequence preserves the rewarding parts of incremental builds without
making cache invalidation the price of admission.

## Front matter and typed metadata

YOCaml separates metadata into three operations: extract it from a document,
validate it into a domain type, and normalize that type into data a template
engine can consume. Providers translate formats such as YAML into the common
`Yocaml.Data.t` representation; `DATA_READABLE` validates that representation;
`DATA_INJECTABLE` projects a typed value back into template data. The official
[metadata introduction](https://yocaml.github.io/tutorial/metadata-intro.html)
describes this relay model.

Front matter is only an extraction strategy. YOCaml supplies the familiar
three-hyphen Jekyll strategy and also allows a custom splitter; the exact API is
in
[`metadata.mli`](https://github.com/xhtmlboi/yocaml/blob/bb3702742410ea0c994cdf795d79a9bfffaf86b3/lib/core/metadata.mli).
The blog tutorial demonstrates YAML front matter being validated as an article
archetype before Markdown and templates are applied in the
[article pipeline](https://yocaml.github.io/tutorial/simple-blog-articles.html#creating-articles).

For Gleam, this suggests a clean boundary:

```text
document text
  -> front-matter split
  -> generic decoded data
  -> validated Page/Article value
  -> template view data
```

Treat missing required fields, invalid dates, and unknown shapes as friendly,
path-aware build errors. Keeping decoding and template projection separate
will make it possible to change YAML libraries or template engines later.

## Markdown and templates are plugins

YOCaml's core does not own Markdown syntax or a single template language. Its
repository packages Markdown and template integrations separately, including
the recommended Cmarkit/Hilite-based Markdown plugin and Jingoo, Liquid, and
Mustache template plugins. The official
[plugin directory](https://github.com/xhtmlboi/yocaml/tree/bb3702742410ea0c994cdf795d79a9bfffaf86b3/plugins)
shows this split.

The recommended Markdown plugin exposes a direct string-to-HTML conversion as
well as task-shaped conversions and optional table-of-contents and syntax
highlighting stages. See
[`yocaml_markdown.mli`](https://github.com/xhtmlboi/yocaml/blob/bb3702742410ea0c994cdf795d79a9bfffaf86b3/plugins/yocaml_markdown/yocaml_markdown.mli).
Jingoo can read one template or a list applied in sequence; each template file
becomes a dependency of the task. See
[`yocaml_jingoo.mli`](https://github.com/xhtmlboi/yocaml/blob/bb3702742410ea0c994cdf795d79a9bfffaf86b3/plugins/yocaml_jingoo/yocaml_jingoo.mli).

The article example's concrete flow is:

```text
read YAML front matter + body
  -> validate metadata
  -> Markdown body to HTML
  -> article template
  -> shared layout template
  -> write the target HTML file
```

That flow is shown in the official
[article tutorial](https://yocaml.github.io/tutorial/simple-blog-articles.html#creating-articles).
It is a strong first end-to-end target for the Gleam project. Start with one
Markdown implementation and a deliberately tiny template feature set. A plugin
interface is worth extracting only after a second implementation exists or is
actively planned.

## Output, batches, and static assets

Output paths are program decisions, not framework convention. YOCaml computes a
target path from a source, changes its extension, then gives the target and task
to an action. `Action.Static.write_file` writes a target only when its tracked
dependencies require it; batch helpers apply an action to matching children of
a directory. Assets can use dependency-aware copy actions. These operations are
documented in
[`action.mli`](https://github.com/xhtmlboi/yocaml/blob/bb3702742410ea0c994cdf795d79a9bfffaf86b3/lib/core/action.mli),
and the tutorial shows concrete path mapping in
[article creation](https://yocaml.github.io/tutorial/simple-blog-articles.html#creating-articles).

For Gleam, keep routing as a pure step from source-relative path plus validated
metadata to output-relative path. Put path traversal and output-root checks at
the final IO boundary. That makes pretty URLs, drafts, and collections later
exercises rather than special cases embedded in the file writer.

## CLI and development server

YOCaml runtimes expose both `run` and `serve`. The Unix `serve` function serves
the output directory and re-runs the build program on each browser request; the
minimal build logic makes unchanged refreshes cheap. The tutorial's small CLI
selects build or server mode from `Sys.argv`, while suggesting a real parser for
a richer interface. See the official
[development-server guide](https://yocaml.github.io/tutorial/simple-blog-server.html)
and current
[`Yocaml_unix` interface](https://github.com/xhtmlboi/yocaml/blob/bb3702742410ea0c994cdf795d79a9bfffaf86b3/plugins/yocaml_unix/yocaml_unix.mli).

This is request-triggered rebuilding, not a documented filesystem watch loop.
The inspected official example offers `build` and `serve` behavior; its source
is
[`simple_blog_unix.ml`](https://github.com/xhtmlboi/yocaml/blob/bb3702742410ea0c994cdf795d79a9bfffaf86b3/examples/simple-blog-unix/bin/simple_blog_unix.ml).
A Gleam learner can therefore add capabilities in a satisfying order: `build`,
then `serve`, then an optional `watch` command if polling or platform-specific
file notifications are interesting in their own right.

## What to borrow, and when

| YOCaml idea | Borrow early | Save for later |
| --- | --- | --- |
| Typed pipeline | Small named transforms with explicit errors | General Arrow/profunctor combinators |
| Runtime boundary | Isolate filesystem and clock operations | Multiple interpreters or Git/browser runtimes |
| Dependencies | Record every source and template read | Dynamic dependency discovery |
| Incrementality | Visible build trace, then timestamp skipping | Persistent hashes and residual cleanup |
| Metadata | Split, decode, validate, project | Multiple providers and custom extraction strategies |
| Rendering | Markdown → page template → layout | Pluggable renderers and syntax highlighting |
| UX | `build` with excellent diagnostics | Server, watch mode, configurable CLI |

The deepest YOCaml lesson is that a build pipeline becomes more powerful when
its structure remains inspectable: inputs, dependencies, errors, and outputs do
not disappear inside arbitrary IO. The learning-project lesson is equally
important: earn that architecture one playful vertical slice at a time.

## Primary sources

- [YOCaml official tutorial: Key concepts](https://yocaml.github.io/tutorial/key-concepts.html)
- [YOCaml official tutorial: Article creation](https://yocaml.github.io/tutorial/simple-blog-articles.html)
- [YOCaml official tutorial: Development server](https://yocaml.github.io/tutorial/simple-blog-server.html)
- [YOCaml official tutorial: Introduction to metadata](https://yocaml.github.io/tutorial/metadata-intro.html)
- [YOCaml official repository](https://github.com/xhtmlboi/yocaml/tree/bb3702742410ea0c994cdf795d79a9bfffaf86b3)
