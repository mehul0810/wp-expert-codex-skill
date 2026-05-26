# Local HTTPS Domain Testing

Use this when a custom local WordPress domain such as `https://example.test`, `https://example.local`, `https://site.wp.local`, or a Local/Studio domain is blocked by the in-app browser because of self-signed certificates, HSTS, DNS, or local proxy behavior.

## Principle

Do not stop runtime validation just because the in-app browser blocks a local HTTPS certificate. Prove reachability with terminal probes, then use a browser runner that can ignore local certificate errors for screenshots and UI smoke checks. If a visual or interaction check cannot be completed, report exactly which surface remains unverified.

## Fast Workaround

1. Confirm the URL and WordPress values:

```bash
wp option get home
wp option get siteurl
```

2. Confirm DNS resolution:

```bash
dscacheutil -q host -a name example.test
```

3. Confirm HTTPS responds while ignoring local cert trust:

```bash
curl -k -sS -I https://example.test/
curl -k -sS https://example.test/wp-json/ | head
```

4. If the in-app browser still blocks the site, use the helper:

```bash
bash /path/to/wp-expert/scripts/wp-local-https-check.sh https://example.test/ /tmp/example-home.png
```

The helper uses `curl -k` for reachability and, when Playwright is installed, Chromium with certificate errors ignored for screenshot-based smoke checks.

## Browser Runner Pattern

When writing ad hoc Playwright checks for local HTTPS domains:

```js
const { chromium } = await import( 'playwright' );
const browser = await chromium.launch( {
	args: [ '--ignore-certificate-errors' ],
} );
const context = await browser.newContext( {
	ignoreHTTPSErrors: true,
	viewport: { width: 1440, height: 900 },
} );
```

Use Chromium first for local cert workarounds. Keep viewports deterministic and capture screenshots for changed UI.

## Diagnosis Matrix

- DNS failure: add or repair local host mapping, restart the local app, flush DNS cache if needed.
- TLS trust failure: use `curl -k`, trust the Local/Studio root certificate, or use Playwright/Chromium with `ignoreHTTPSErrors`.
- HTTP works but HTTPS fails: inspect local server SSL config, port mapping, and app router.
- Browser shows old content: clear browser cache, restart local app, flush WordPress/object/page cache.
- WordPress redirects to a different host: check `home`, `siteurl`, multisite domain mapping, and reverse proxy headers.
- REST works but page fails: inspect PHP fatal logs, theme template errors, asset URLs, mixed content, and blocked scripts.

## Reporting Rules

- Say "terminal HTTPS reachability verified" when only `curl -k` or server probes pass.
- Say "browser rendering verified" only after a browser runner or real browser loads the page and checks the relevant state.
- Do not claim visual parity if screenshots could not be captured.
- Include the exact URL, status code, redirect target, and any remaining blocked surface.
