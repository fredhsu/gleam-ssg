# Module 9 — Open the workshop

**Time:** 60–90 minutes, or two snack sessions
**Unlocks:** a recognizable multi-page site

## Mission

Discover all supported content, plan the complete build, reject conflicts, then
execute it. Copy static assets as a second kind of build action.

## Split this module if useful

- **Session A:** discovery and complete planning, with no writes.
- **Session B:** execution and static assets.

## Main quest

- [ ] Recursively discover files beneath the content root.
- [ ] Filter supported files explicitly and sort them for deterministic behavior.
- [ ] Convert each content file into a planned output.
- [ ] Add static-file copies to the same plan or a clearly related action type.
- [ ] Validate route collisions across generated pages *and* copied assets.
- [ ] Execute only after the whole plan validates.
- [ ] Print a compact summary of generated and copied files.

## Think in plans

A build plan is useful even if it is just a list of actions. It creates a seam for
dry runs, collision checks, deterministic ordering, incremental builds, and better
diagnostics. Keep it data until execution requires effects.

## Weird-input deck

Try an empty site, nested directories, an ignored editor file, a static
`about/index.html` that collides with `content/about.md`, and a broken page among
valid ones. Decide whether planning accumulates errors or stops at the first.

## Victory condition

One command builds at least three nested pages and a stylesheet. The build performs
no writes when its complete plan is invalid, and repeated builds have identical
outputs and ordering.

## Stretch quest

Add a dry-run reporter that prints the plan without touching the output directory.
If planning is truly data, this should feel pleasantly small.

## Trail marker

Use the generator to build a tiny “museum of odd inputs” site.

