#!/bin/bash
# Validation script for the workshop Hugo site
# Checks that the build is healthy and required files are present

set -e

PASS=0
FAIL=0

check() {
  local label="$1"
  local result="$2"
  if [ "$result" = "ok" ]; then
    echo "  ✓ $label"
    PASS=$((PASS + 1))
  else
    echo "  ✗ $label — $result"
    FAIL=$((FAIL + 1))
  fi
}

echo ""
echo "=== Hugo Site Validator ==="
echo ""

# --- Required files ---
echo "[1/4] Required files"

[ -f "netlify.toml" ] && check "netlify.toml exists" "ok" || check "netlify.toml exists" "missing"
[ -f "config/_default/hugo.toml" ] && check "hugo.toml exists" "ok" || check "hugo.toml exists" "missing"
[ -f "config/_default/params.toml" ] && check "params.toml exists" "ok" || check "params.toml exists" "missing"
[ -f "config/_default/languages.en.toml" ] && check "languages.en.toml exists" "ok" || check "languages.en.toml exists" "missing"
[ -f "config/_default/menus.en.toml" ] && check "menus.en.toml exists" "ok" || check "menus.en.toml exists" "missing"
[ -f ".gitignore" ] && check ".gitignore exists" "ok" || check ".gitignore exists" "missing"
[ -f ".gitmodules" ] && check ".gitmodules exists (Blowfish submodule)" "ok" || check ".gitmodules exists (Blowfish submodule)" "missing"
[ -d "themes/blowfish" ] && check "Blowfish theme directory exists" "ok" || check "Blowfish theme directory exists" "missing"

# --- Required content ---
echo ""
echo "[2/4] Required content pages"

[ -f "content/_index.md" ] && check "Homepage (_index.md)" "ok" || check "Homepage (_index.md)" "missing"
[ -f "content/about.md" ] && check "About page" "ok" || check "About page" "missing"
[ -f "content/publications.md" ] && check "Publications page" "ok" || check "Publications page" "missing"
[ -f "content/research.md" ] && check "Research page" "ok" || check "Research page" "missing"
[ -f "content/teaching.md" ] && check "Teaching page" "ok" || check "Teaching page" "missing"
[ -f "content/guide.md" ] && check "Workshop guide page" "ok" || check "Workshop guide page" "missing"

# --- Hugo build ---
echo ""
echo "[3/4] Hugo build"

if hugo --minify --quiet 2>/dev/null; then
  check "hugo --minify succeeds" "ok"
else
  check "hugo --minify succeeds" "build failed — run 'hugo' to see errors"
fi

# --- Build output checks ---
echo ""
echo "[4/4] Build output"

[ -f "public/index.html" ] && check "public/index.html generated" "ok" || check "public/index.html generated" "missing — build may have failed"
[ -f "public/about/index.html" ] && check "About page rendered" "ok" || check "About page rendered" "missing"
[ -f "public/publications/index.html" ] && check "Publications page rendered" "ok" || check "Publications page rendered" "missing"
[ -f "public/research/index.html" ] && check "Research page rendered" "ok" || check "Research page rendered" "missing"
[ -f "public/guide/index.html" ] && check "Workshop guide page rendered" "ok" || check "Workshop guide page rendered" "missing"
[ -f "public/sitemap.xml" ] && check "sitemap.xml generated" "ok" || check "sitemap.xml generated" "missing"

# Check output size is non-trivial (> 50KB means real content rendered)
if [ -d "public" ]; then
  SIZE=$(du -sk public | cut -f1)
  if [ "$SIZE" -gt 50 ]; then
    check "Build output size reasonable (${SIZE}KB)" "ok"
  else
    check "Build output size reasonable" "suspiciously small (${SIZE}KB) — check for errors"
  fi
fi

# --- Summary ---
echo ""
echo "==========================="
echo "  Passed: $PASS"
echo "  Failed: $FAIL"
echo "==========================="
echo ""

if [ "$FAIL" -gt 0 ]; then
  echo "Some checks failed. Fix the issues above before deploying."
  exit 1
else
  echo "All checks passed. Site looks good!"
  exit 0
fi
