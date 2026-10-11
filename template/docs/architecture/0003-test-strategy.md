# Integration and E2E tests with GIVEN / WHEN / THEN

**Status**: Accepted

## Context

A successful static build does not prove that visitors see the intended content,
follow the right links or can use a form. Tests should describe those outcomes.

## Decision

**Integration and E2E tests only. Never write unit tests.** Every behaviour
change includes an integration test; changed user flows also include browser E2E.
A bug fix starts with a scenario that reproduces the bug.

Integration tests build the real Astro site and inspect the generated pages.
Browser E2E serves that build and drives the real page. Do not test isolated
helpers or mock our own components. For an external form or API provider, use
a local stand-in over the real protocol; replace only an external boundary
that cannot run locally and document why.

Write explicit **GIVEN / WHEN / THEN**:

- **GIVEN:** arrange the page content and any provider state needed by the scenario.
- **WHEN:** perform one business action, such as following a link or submitting a form.
- **THEN:** assert what the visitor sees or the provider receives.

Keep scenarios independent and fixture values visible. Success and failure
are separate scenarios; related scenarios may share one focused spec file.
Find browser controls by role and visible label, using data-testid only when
there is no suitable semantic locator. Never send test sign-ups to a live provider.

## Consequences

- Tests check the built artifact and the actual visitor flow.
- Browser tests catch behaviour a build check cannot establish.
- External integrations need a disposable local test setup.

## Alternatives considered

- **Build only:** catches compilation errors, not broken interactions.
- **Unit tests or mocked components:** omit the deployed page and integration.
- **Live provider accounts:** introduce network dependence and real side effects.
