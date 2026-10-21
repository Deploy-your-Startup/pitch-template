# Maintaining the pitch template

Copier renders this repository using `copier.yml`. The custom delimiters retain
the existing `§§deploy_your_startup.<field>§§` placeholders while leaving Astro
and GitHub Actions expressions untouched. No template tasks or migrations
execute shell commands.

The template asks for three public parameters only: `project_name`,
`base_domain` and `github_username`. Cloudflare credentials are stored by
startup CLI as secrets of the generated project's `production` environment,
which only `main` can deploy to, and never appear in Copier answers.

The generated `deploy.yml` calls the `deploy-pages.yml` reusable workflow from
the owner's `deploy-your-startup` repository, which `startup sync` maintains.

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
