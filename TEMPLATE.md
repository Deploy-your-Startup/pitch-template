# Maintaining the pitch template

Copier renders this repository using `copier.yml`. The custom delimiters retain
the existing `§§deploy_your_startup.<field>§§` placeholders while leaving Astro
and GitHub Actions expressions untouched. No template tasks or migrations
execute shell commands.

The template asks for public parameters only: `project_name`, `base_domain`,
`github_username`, and the shared deployment `deploy_repository` and
`deploy_ref`, which default to the `v1.0.0` release of `Deploy-your-Startup/deploy`. Cloudflare credentials are stored by
startup CLI as repository secrets of a private generated project, or as secrets
of a `production` environment that only `main` can deploy to once it is public.
They never appear in Copier answers.

The generated `deploy.yml` calls the `container-e2e.yml` and `deploy-pages.yml`
reusable workflows of `deploy_repository` at `deploy_ref`; `startup update` moves
a generated project to a newer release.

Release tested commits with version tags. A consumer stores the exact source
and baseline in `.copier-answers.yml`.

Render and build a test project locally:

```bash
uvx --from copier==9.18.2 copier copy --defaults --vcs-ref HEAD \
  --data project_name=template-check --data base_domain=example.com \
  --data github_username=example . ../generated
cd ../generated && ./make.sh build
```

The template CI performs the same render, fails on unresolved placeholders and
checks the built page.
