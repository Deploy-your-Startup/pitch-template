import { defineConfig } from "@playwright/test";
export default defineConfig({
  testDir: "./tests",
  fullyParallel: true,
  workers: 1,
  forbidOnly: Boolean(process.env.CI),
  use: { baseURL: "http://127.0.0.1:4321", trace: "retain-on-failure" },
  webServer: {
    // Keep Astro in the foreground so Playwright owns the server and its teardown.
    command: "cd ../frontend && npm run preview -- --host 0.0.0.0 --ignore-lock",
    url: "http://127.0.0.1:4321",
    reuseExistingServer: false,
  },
});
