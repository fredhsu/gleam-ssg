# Module 6 — Invite Markdown

**Time:** 35–60 minutes
**Unlocks:** real article content

## Mission

Replace the disposable mini-format from Module 1 with a Markdown adapter while
keeping the rest of the pipeline unchanged.

## Package field trip

Evaluate at least two options. At the time these notes were written,
[Mörk](https://hex.pm/packages/mork) was a Gleam Markdown parser with HTML output;
the package ecosystem will evolve, so check current docs and source.

Score candidates from 0–2 on:

| Question | Candidate A | Candidate B |
|---|---:|---:|
| Supports the chosen runtime | | |
| CommonMark behavior is documented/tested | | |
| Exposes structured errors or a useful AST | | |
| Avoids owning front-matter policy | | |
| Small enough API for this project | | |

This is a learning exercise, not a mandate to write a Markdown parser.

## Main quest

- [ ] Add the chosen package through Gleam's dependency tooling.
- [ ] Create one small project-owned `markdown.render` adapter.
- [ ] Feed only the body from the front-matter stage into it.
- [ ] Keep third-party types from spreading through the whole project.
- [ ] Add a fixture with a heading, link, code span, and list.
- [ ] Test one behavior you rely on and one awkward input.

## Security pause

Decide whether raw HTML inside Markdown is allowed. Static does not mean safe if
untrusted authors can supply content. Record the trust model even if the first site
has only one trusted author.

## Victory condition

Switching Markdown libraries would mostly change one module and its tests. The
generated page contains recognizable HTML for the fixture.

## Stretch quest

If the library exposes an AST, inspect it and imagine one transformation such as
heading links. Do not implement an extension unless the experiment is irresistible.

## Trail marker

Record one package behavior the adapter now makes your project responsible for.

