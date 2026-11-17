# Deploy your Startup — Pitch template

A versioned Copier template for a static Astro landing page deployed to
Cloudflare Pages, maintained through startup CLI. The generated project lives
under `template/`; instructions for maintainers are in [TEMPLATE.md](TEMPLATE.md).

```bash
startup bootstrap --kind pitch --template-version <tag-or-commit>
```

This repository is not an application checkout. Generate a test project before
running its tasks. CI generates the project, fails on unresolved placeholders
and builds the site.

The generated project's deployment version is configured once in
`.github/workflows/startup.yml`. Other workflows and local CLI operations use
that reference. `startup update` changes it; no separate role pin or checksum
files are required. A successful Actions deployment run records execution.
