# Module 13 — Ship the tiny forge

**Time:** 60–90 minutes
**Unlocks:** a coherent v0.1 and permission to stop

## Mission

Build the project from a clean state, tighten its public story, and choose whether
one optional feature deserves a short second season.

## The v0.1 run

- [ ] Remove the generated output directory and rebuild the example site.
- [ ] Run all tests and inspect compiler warnings.
- [ ] Build a second time and verify the incremental report.
- [ ] Break one content file and confirm that no misleading partial success occurs.
- [ ] Inspect generated links and HTML in a browser.
- [ ] Write the real install, build, and test commands in the README.
- [ ] Replace the working title—or proudly keep it.

## Architecture tour

Explain the system aloud in five minutes:

```text
CLI -> discovery -> typed content -> output plan -> freshness -> execution
```

For each arrow, name its error type and whether it performs effects. Anything you
cannot explain becomes either a small cleanup or an honest limitation in the docs.

## Choose one ending

### Happy ending

Tag v0.1, publish a tiny site with it, and stop. Finishing is a feature.

### Bonus season

Pick exactly one:

- **Preview server:** serve `_site` and optionally rebuild on each request. YOCaml's
  documented server follows this request-triggered model.
- **Watch mode:** observe filesystem changes and trigger builds. This is distinct
  from a preview server and may introduce platform-specific concerns.
- **Feeds:** generate Atom/RSS from the typed collection.
- **A second renderer:** use the existing adapter boundary to try Djot or plain HTML.
- **Portable runtime:** identify and replace the Erlang-specific effect surface.

Write a one-page expedition brief before coding: desired experience, new concept,
smallest demo, and stop condition.

## Retrospective prompts

- Which Gleam feature changed how you modeled the problem?
- Which abstraction was useful only after you had concrete duplication?
- Which YOCaml idea did you borrow, simplify, or decline?
- Where are errors most helpful? Where are they still vague?
- What would you keep if you rebuilt the project in another language?

## Final victory condition

The tool builds a site you care about, the docs tell the truth, the tests protect
the important rules, and you can leave the repository for a month with an obvious
way back in.

## Reward

Write one page *using the generator* about the strangest bug or nicest type you met
on the trail. Let the tool publish its own origin story.

