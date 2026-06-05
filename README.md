# §§deploy_your_startup.project_name§§

A lightweight landing page built with [Astro](https://astro.build), deployed to
[Cloudflare Pages](https://pages.cloudflare.com) via GitHub Actions on push to `main`.

Live: https://§§deploy_your_startup.base_domain§§

## Development

```bash
npm install
npm run dev      # http://localhost:4321
npm run build    # static output in dist/
```

## Deployment

Every push to `main` triggers `.github/workflows/deploy.yml`. The workflow
requires two repository secrets:

- `CLOUDFLARE_API_TOKEN` — scoped token with `Cloudflare Pages: Edit` and `Account: Read`
- `CLOUDFLARE_ACCOUNT_ID` — your Cloudflare account ID (`wrangler whoami` shows it)

Both are set automatically by `startup bootstrap` in pitch mode.

## Custom Domain

Configure §§deploy_your_startup.base_domain§§ as a custom domain in the
Cloudflare Pages project settings — Cloudflare provisions the certificate
automatically.
