# Module 2 — Page passport

**Time:** 35–60 minutes
**Unlocks:** a typed page and honest failures

## Mission

Replace “a few strings that happen to travel together” with a page model. Practice
custom types, records, pattern matching, and `Result` by making invalid page states
harder to represent.

## Model on paper first

List facts a valid page needs *right now*. Likely candidates are a title and body.
Keep source path and route out until a behavior requires them. For each field ask:

- Can it be absent?
- Is an empty string valid?
- Is it source data, derived data, or build context?

## Main quest

- [ ] Define a `Page` type that supports the current renderer.
- [ ] Create a constructor or decoder that validates the title.
- [ ] Define a specific error variant instead of returning an unexplained string.
- [ ] Update rendering to accept only a valid `Page`.
- [ ] Test one success and at least two failures.

A useful shape to consider—not a required answer—is a private representation with
a public validating function. Let the compiler prevent bypassing rules that matter.

## Result relay

Create three tiny fallible steps and compose them without assertions in production
code. Observe the difference between transforming a success value and chaining a
function that can itself fail.

## Weird-input card

Try a whitespace-only title or an extremely long one. The point is not to invent
perfect policy; it is to distinguish parsing from validation.

## Victory condition

The renderer cannot be called with a page missing required data, and failures are
values a caller can inspect. Tests name the validation rules.

## Stretch quest

Give errors a presentation function. Keep the error value structured and decide at
the outer edge how it should look to a human.

## Trail marker

Answer: “What contextual fact would make the next error message more useful?”

