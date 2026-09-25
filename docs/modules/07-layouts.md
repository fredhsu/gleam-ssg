# Module 7 — Dress the page

**Time:** 45–75 minutes
**Unlocks:** complete, valid HTML documents

## Mission

Wrap rendered Markdown in a site layout using ordinary Gleam values and functions.
Learn where escaping is necessary and where already-rendered HTML must remain HTML.

## Start without a template language

Define the data a layout needs: page title, public route, rendered body, and maybe
the site title. A function can render the first layout. This keeps the seam visible
before choosing external syntax.

## Main quest

- [ ] Introduce a layout input type rather than a long list of same-typed strings.
- [ ] Produce a complete document with doctype, language, head, and body.
- [ ] Escape metadata inserted into text or attribute positions.
- [ ] Insert the Markdown result as trusted rendered content exactly once.
- [ ] Link the example stylesheet using a root-relative or route-aware URL.
- [ ] Test a title containing `&` and `<`.

## The two-string problem

Gleam sees both plain text and HTML as `String`. Consider small wrapper types such
as `EscapedText` or `RenderedHtml` if they prevent a real mix-up. Do not build a
full HTML type system unless the mistakes justify it.

## Experiment

Render the same page with two layouts. What minimum function signature makes the
choice interchangeable? Which site-wide value should not be stored on every page?

## Victory condition

The output opens as a complete styled page, dynamic text is escaped in the tested
positions, and the layout does not read files or global state.

## Stretch quest

Evaluate a Gleam HTML builder or template package. Write a short comparison with
the function approach; switching is optional.

## Trail marker

Name every point at which a plain string crosses into an HTML context.

