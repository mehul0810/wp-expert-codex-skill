#!/usr/bin/env bash
set -euo pipefail

url="${1:-}"
screenshot_path="${2:-}"

if [ -z "$url" ]; then
  echo "usage: bash wp-expert/scripts/wp-local-https-check.sh https://example.test/ [/tmp/screenshot.png]" >&2
  exit 1
fi

host="$(printf '%s\n' "$url" | sed -E 's#^[a-zA-Z]+://([^/:]+).*#\1#')"
scheme="$(printf '%s\n' "$url" | sed -E 's#^([a-zA-Z]+)://.*#\1#')"
port="$(printf '%s\n' "$url" | sed -nE 's#^[a-zA-Z]+://[^/:]+:([0-9]+).*#\1#p')"

if [ -z "$port" ]; then
  if [ "$scheme" = "https" ]; then
    port="443"
  else
    port="80"
  fi
fi

echo "== Target =="
echo "url: $url"
echo "host: $host"
echo "port: $port"

echo
echo "== DNS =="
if command -v dscacheutil >/dev/null 2>&1; then
  dscacheutil -q host -a name "$host" || true
elif command -v getent >/dev/null 2>&1; then
  getent hosts "$host" || true
else
  echo "no DNS helper found"
fi

echo
echo "== HTTPS Probe =="
if command -v curl >/dev/null 2>&1; then
  curl -k -sS -L -o /tmp/wp-local-https-check-body.$$ \
    -w 'http_code=%{http_code}\nssl_verify_result=%{ssl_verify_result}\nurl_effective=%{url_effective}\ncontent_type=%{content_type}\ntime_total=%{time_total}\n' \
    "$url"
  rm -f /tmp/wp-local-https-check-body.$$
else
  echo "curl not found"
fi

if [ "$scheme" = "https" ] && command -v openssl >/dev/null 2>&1; then
  echo
  echo "== TLS Handshake =="
  printf '' | openssl s_client -connect "$host:$port" -servername "$host" -brief 2>/dev/null | sed -n '1,20p' || true
fi

if [ -n "$screenshot_path" ]; then
  echo
  echo "== Browser Screenshot =="
  if ! command -v node >/dev/null 2>&1; then
    echo "skipped: node not found"
    exit 0
  fi

  node - "$url" "$screenshot_path" <<'NODE'
const targetUrl = process.argv[2];
const screenshotPath = process.argv[3];

( async () => {
	let chromium;
	try {
		( { chromium } = await import( 'playwright' ) );
	} catch ( error ) {
		console.log( 'skipped: playwright is not installed in this project/runtime' );
		return;
	}

	const browser = await chromium.launch( {
		args: [ '--ignore-certificate-errors' ],
	} );
	const context = await browser.newContext( {
		ignoreHTTPSErrors: true,
		viewport: { width: 1440, height: 900 },
	} );
	const page = await context.newPage();
	const response = await page.goto( targetUrl, {
		waitUntil: 'networkidle',
		timeout: 30000,
	} );
	console.log( `status=${ response ? response.status() : 'no-response' }` );
	console.log( `title=${ await page.title() }` );
	await page.screenshot( { path: screenshotPath, fullPage: true } );
	await browser.close();
	console.log( `screenshot=${ screenshotPath }` );
} )().catch( ( error ) => {
	console.error( error.message );
	process.exit( 1 );
} );
NODE
fi
