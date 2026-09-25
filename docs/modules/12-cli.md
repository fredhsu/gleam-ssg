# Module 12 — Give it a front door

**Time:** 40–70 minutes
**Unlocks:** a humane `build` command

## Mission

Turn the working program into a command-line tool someone else could use without
reading its source.

## Design the transcript first

Write ideal terminal sessions for:

1. a successful build;
2. an invalid content directory;
3. malformed front matter;
4. a route collision; and
5. help output.

Decide what goes to normal output, what is an error, and which cases return a
non-zero exit status.

## Package field trip

For more than a single positional argument, evaluate a package such as
[glint](https://hexdocs.pm/glint/), which provides commands, flags, and generated
help. Keep CLI-library values at the edge and translate them into a small project
configuration type.

## Main quest

- [ ] Add a `build` command with content and output directory options.
- [ ] Supply safe, unsurprising defaults for the example site.
- [ ] Print counts for built, copied, and skipped outputs.
- [ ] Render structured build errors consistently.
- [ ] Return an unsuccessful status on failure.
- [ ] Document one copy-pastable example.

## UX challenge

Run the tool from the wrong directory. The error should say which resolved path it
tried, not merely “not found.” Then trigger a collision and check that both source
paths are visible.

## Victory condition

A friend could discover the build command through help, build the example site,
and know what to fix after a deliberate content error.

## Stretch quest

Add `--dry-run` or `--force`, whichever your architecture already made nearly
free. Avoid flags without a concrete user story.

## Trail marker

Paste the best successful and failed transcripts into the README or field notes.

