#!/usr/bin/env bash
# Pre-commit / pre-release secret scanner for Tinfoil-Themes.
#
#   ./scripts/scan-secrets.sh            scan working tree + tracked files
#   ./scripts/scan-secrets.sh --staged   scan only what git has staged
#
# Exit 0 = clean, 1 = something sensitive found.
#
# This repo is theme archives, screenshots and a manifest - not code - and
# carries none of the console-unique-key or Tinfoil-shop-credential risk the
# other A-Theme repos do. The realistic risk here is smaller and generic: a
# stray personal token or key pasted into a script, workflow file, or README
# while adding tooling later.

set -uo pipefail
cd "$(dirname "$0")/.." || exit 1

RED=$'\033[0;31m'; GRN=$'\033[0;32m'; YEL=$'\033[0;33m'; RST=$'\033[0m'
FAIL=0
note()  { printf '%s\n' "$*"; }
bad()   { printf '%s[LEAK]%s %s\n' "$RED" "$RST" "$*"; FAIL=1; }
warn()  { printf '%s[warn]%s %s\n' "$YEL" "$RST" "$*"; }
ok()    { printf '%s[ ok ]%s %s\n' "$GRN" "$RST" "$*"; }

STAGED=0
[[ "${1:-}" == "--staged" ]] && STAGED=1

GENERIC='(ghp_[A-Za-z0-9]{36}|github_pat_[A-Za-z0-9_]{22,}|AKIA[0-9A-Z]{16}|-----BEGIN [A-Z ]*PRIVATE KEY-----|discord\.com/api/webhooks/[0-9]+/[A-Za-z0-9_-]+)'

note "=== 1. Generic credential files in the working tree ==="
FOUND=0
for f in .env .env.local config.json credentials.json; do
    [[ -f "$f" ]] || continue
    FOUND=1
    if git check-ignore -q "$f" 2>/dev/null; then
        warn "$f present but gitignored"
    else
        bad "$f present and NOT ignored by git"
    fi
done
[[ $FOUND -eq 0 ]] && ok "no obvious credential files in the working tree"

note ""
note "=== 2. Token/key patterns in tracked or staged files ==="
if [[ $STAGED -eq 1 ]]; then
    SCAN=$(git diff --cached --name-only --diff-filter=ACM 2>/dev/null)
else
    SCAN=$(git ls-files 2>/dev/null)
fi

HITS=0
while IFS= read -r f; do
    [[ -z "$f" || ! -f "$f" ]] && continue
    case "$f" in scripts/scan-secrets.sh|scripts/pre-commit) continue ;; esac
    # Skip theme/screenshot binaries - matching inside a .zip/.7z/image is
    # noise, not a real hit, and most tracked files here are exactly that.
    case "$f" in *.zip|*.7z|*.jpg|*.jpeg|*.png|*.gif|*.webp) continue ;; esac
    if LC_ALL=C grep -qE "$GENERIC" "$f" 2>/dev/null; then
        bad "token/key-shaped content in: $f"; HITS=1
    fi
done <<< "$SCAN"
[[ $HITS -eq 0 ]] && ok "no token/key-shaped content in tracked text files"

note ""
if [[ $FAIL -eq 0 ]]; then
    printf '%s=== CLEAN ===%s\n' "$GRN" "$RST"
else
    printf '%s=== FAILED - do not commit or publish ===%s\n' "$RED" "$RST"
fi
exit $FAIL
