# Module 10 — Make a gathering

**Time:** 50–80 minutes
**Unlocks:** a page derived from the whole site

## Mission

Generate an index page from several content items. This introduces aggregation:
some outputs depend on the *collection*, not just one input document.

## Pick one gathering

Choose the one your tiny site actually wants:

- a notes index sorted by date or title;
- a tag page listing matching articles;
- a home page showing the latest few entries; or
- an archive grouped by year.

Avoid implementing a generic query language. One honest use case teaches the
dependency problem better.

## Main quest

- [ ] Extend metadata only with fields the chosen collection needs.
- [ ] Separate page discovery/decoding from page rendering so the collection can
      see typed summaries.
- [ ] Define deterministic sorting, including tie-breaking.
- [ ] Render the derived page through the same layout boundary as normal pages.
- [ ] Add its route to the complete build plan and collision checks.
- [ ] Test empty, single-item, and tied-order collections.

## Dependency puzzle

If any article title changes, should the index rebuild? What if the article body
changes? Record the inputs the collection actually uses. This is a rehearsal for
incremental dependency tracking.

## Boss fight: drafts

If you added draft metadata, ensure drafts neither render as pages nor leak into
the collection. Decide whether the planner filters them or discovery omits them.

## Victory condition

The generated collection is deterministic, shares the normal layout machinery,
and its dependencies can be explained without saying “everything, probably.”

## Stretch quest

Generate one page per tag by transforming a dictionary of tag-to-pages into build
actions. Stop before creating pagination.

## Trail marker

Draw arrows from the chosen index output to every fact that can change it.

