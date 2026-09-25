# The side-quest learning method

This project should generate curiosity, not obligation. Work in tiny closed loops
and choose the size of session that matches the energy you actually have.

## Choose today's mode

### Snack mode — 15 to 25 minutes

Pick one checkbox, one test case, or one design question. Stop after recording what
you learned. A snack session is a complete session.

### Campfire mode — 45 to 75 minutes

Complete a module's main quest: predict, implement one slice, run it, and leave a
short field note.

### Expedition mode — up to two hours

Do the main quest plus one stretch quest. Finish by shrinking or documenting any
unfinished experiment so the next session starts cleanly.

Use a timer if you tend to disappear into infrastructure. When it rings, reach a
checkpoint rather than opening another abstraction.

## The loop

Every module uses the same five-beat loop:

1. **Predict.** Write down what you expect before reading an API or running code.
2. **Make it visible.** Produce one observable behavior: terminal text, a file, a
   rendered page, or a failing test.
3. **Name the rule.** Express the behavior as a type, function name, or test.
4. **Disturb it.** Try one awkward input and inspect the failure.
5. **Leave a trail marker.** Add a field note and write the next tiny action.

That final action should be almost comically specific: “add a collision fixture”
is better than “work on routing.”

## Hint ladder

When stuck, reveal help gradually:

1. Restate the input, output, and one example without code.
2. Write the function signature or data type only.
3. Make one concrete case pass, even if inelegantly.
4. Read the narrowest relevant official API page.
5. Ask for a hint that preserves the problem, for example:
   “Give me two questions to diagnose this Result pipeline; no implementation.”

Ask for full code only when learning the code is not the point—for example, a
throwaway fixture helper. Even then, explain it back in your own words.

## Tests as experiments

A useful test names a product rule. Prefer examples such as:

- `notes/hello.md` maps to `notes/hello/index.html`;
- missing titles are reported with the source path;
- two pages cannot claim the same route;
- changing a layout marks its pages stale.

Avoid chasing coverage percentages. A handful of examples around decisions beats
many tests around library plumbing. Gleam's CLI provides `gleam test`; see the
[official command reference](https://gleam.run/documentation/command-line-reference/).

## Keeping it playful

- Give each generated fixture site a theme: field guide, tiny museum, recipe box.
- Keep a “weird input” deck and draw one card per module.
- Save screenshots when the output first looks right.
- Name milestones: first spark, first map, first time machine.
- After every three modules, use the tool to publish a short note about building it.

## When to refactor

Refactor when you can point to repeated knowledge or an awkward boundary. Do not
refactor merely because a future plugin system might want something. A good prompt
is: “Which decision is duplicated, and what name would let it live in one place?”

## Session closing ritual

- [ ] The project builds or the failure is recorded clearly.
- [ ] The smallest relevant test was run.
- [ ] One field note says what surprised me.
- [ ] One next action can be finished in about ten minutes.
- [ ] I stopped while I still knew what to do next.

