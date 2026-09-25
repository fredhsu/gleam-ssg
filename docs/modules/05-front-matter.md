# Module 5 — Read the label

**Time:** 45–75 minutes
**Unlocks:** typed metadata with useful diagnostics

## Mission

Split a document into metadata and content, decode the metadata into your page
type, and report mistakes with source context.

## Choose the smallest format

Start with a delimiter and a format handled by a maintained parser, or an extremely
small `key: value` subset whose limitations you state. Do not accidentally promise
full YAML by implementing three string operations.

Example fixture:

```text
---
title: A tiny hello
draft: false
---
Welcome to the forge.
```

For the first pass, only `title` must affect behavior. Other fields may be rejected
or deliberately ignored; choose and test one policy.

## Main quest

- [ ] Split header from body without losing body whitespace unintentionally.
- [ ] Decode raw keys and values.
- [ ] Validate required and optional fields into a typed metadata value.
- [ ] Include the source path in diagnostics without making the pure parser read
      the filesystem.
- [ ] Distinguish malformed syntax from valid syntax with invalid values.
- [ ] Test missing delimiter, missing title, duplicate key, and ordinary content.

## Error workshop

Arrange one error message to answer:

1. Which file?
2. Which field or region?
3. What was expected?
4. What can the author do next?

Keep those facts structured for as long as possible. Format prose at the CLI edge.

## Victory condition

A source string becomes either a typed page draft or a specific error. The body is
ready for Markdown, and malformed metadata never reaches the renderer.

## Stretch quest

Add a `draft` field. Decide whether filtering drafts is parsing, planning, or
rendering behavior, and defend that placement in a decision postcard.

## Trail marker

Write one metadata feature you are intentionally *not* adding yet.

