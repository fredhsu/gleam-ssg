# Module 11 — Teach it memory

**Time:** two 45–75 minute sessions
**Unlocks:** dependency-aware selective rebuilding

## Mission

Skip work only when you can explain why an existing output is fresh. This module
borrows YOCaml's minimal-build idea in deliberately small stages.

## Session A — Make dependencies visible

- [ ] For every planned output, record its known input paths.
- [ ] Include the content source and shared layout or configuration inputs.
- [ ] Print a build explanation: `BUILD` with a reason, or `SKIP` with a reason.
- [ ] Treat missing outputs as stale.
- [ ] Test the freshness decision as a pure comparison of supplied facts.

Start with **static dependencies**: inputs known while planning. Do not add a cache
until the plan itself accurately says what each output uses.

## Session B — Skip and invalidate

- [ ] Obtain modification times at the effect boundary.
- [ ] Skip when the target exists and no dependency is newer.
- [ ] Change one article and observe one article output plus its collection rebuild.
- [ ] Change the shared layout and observe every dependant rebuild.
- [ ] Delete or rename an input and decide how stale output is removed or reported.
- [ ] Test equal timestamps and unavailable metadata.

## Correctness traps

- Timestamp resolution may be coarser than a rapid edit/build cycle.
- Clock skew can make “newer than” untrustworthy.
- A changed compiler, renderer version, or configuration may not be a file change.
- A corrupt or missing cache must never make an incorrect build look successful.

For v0.1, it is fine to choose conservative rebuilding when uncertain.

## Cache checkpoint

Only after timestamp logic works, decide whether content hashes or dynamic
dependencies justify a persistent build record. If you add one, version its format,
write it only after successful outputs, and make corruption recoverable by rebuild.

YOCaml stores target/dependency information in a persistent cache because some
dependencies emerge during execution. Your first version need not match that
power. The detailed comparison is in
[the YOCaml architecture notes](../research/yocaml-architecture.md).

## Victory condition

Build logs accurately explain selected work, source and layout changes invalidate
the expected outputs, and uncertain state rebuilds rather than silently skipping.

## Stretch quest

Add a `--force` concept at the planning level. It should change freshness policy,
not fork the whole build implementation.

## Trail marker

Call the first successful no-op build “the tiny time machine” in your field notes.

