# Startup landing page instructions

An Astro landing page in `frontend/`, built to static files and deployed to
Cloudflare Pages by `.github/workflows/deploy.yml` on every push to `main`.

```bash
./make.sh run      # local dev server on http://localhost:4321
./make.sh build    # static output in frontend/dist/
./make.sh preview  # serve the production build locally
```

`make.sh` is the contract for every module: add new commands there and keep
`mise.toml` tasks delegating to it. A new module (for example `backend/`) lives
next to `frontend/` with its own `make.sh`.

Cloudflare credentials stay in repository secrets set by `startup bootstrap`.
Never print, commit or hard-code them, and do not deploy manually unless the
user asks for it.

## Working conventions

- KEEP IT SIMPLE: a landing page needs no framework beyond Astro. Avoid
  over-engineering, premature abstractions and unnecessary dependencies.
- Never push directly to `main`; every push deploys. Use a feature branch and a
  pull request. Branch names and commit format:
  [`.github/git-commit-instructions.md`](.github/git-commit-instructions.md).
- **Pull request titles and descriptions are always in English**, even when the
  conversation was in another language.
- Tests: integration and E2E tests only, never unit tests, and no mocks; an
  external service gets a small local stand-in service. Structure every test as
  GIVEN / WHEN / THEN and find elements by role and visible label.
- Before finishing, run `./make.sh build`.

## Code style

- Prefer descriptive names over abbreviations.
- Boolean functions and variables start with `is`, `has`, `can` or `should`.
- Declare return types on named TypeScript functions.
- Prefer native HTML elements (`<dialog>`, `<details>`, `<form>`) over
  reimplementing their behaviour in JavaScript; ship as little client-side
  JavaScript as possible.
- Keep pages accessible: semantic headings, labelled controls, alt text.
- Comment the why, not the what; document a rule once at its interface
  (ADR 0001).

## Architecture decisions

Record decisions that shape the project as numbered ADRs in
`docs/architecture/` and list them here with when to load them.

- [ADR 0001](docs/architecture/0001-documentation-at-interfaces.md) — load when adding comments, documentation or an ADR.
- [ADR 0002](docs/architecture/0002-static-landing-page.md) — load for hosting, framework or backend choices.

## Template updates (Copier)

From the repo root with a clean working tree:

```bash
startup template update --version main --dry-run
startup template update --version main
```

Review the diff, resolve conflicts, run `./make.sh build`, then commit
including `.copier-answers.yml`. Do not edit Copier answers manually.
