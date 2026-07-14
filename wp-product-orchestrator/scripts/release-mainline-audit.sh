#!/usr/bin/env bash
set -euo pipefail

subject="${1:-}"
main_ref="${2:-origin/main}"
expected="${3:-}"

if [ -z "$subject" ]; then
  echo "usage: release-mainline-audit.sh <tag-or-sha> [main-ref] [expected-sha]" >&2
  exit 2
fi

subject_commit="$(git rev-parse --verify --end-of-options "${subject}^{commit}")"
main_commit="$(git rev-parse --verify --end-of-options "${main_ref}^{commit}")"

if [ -n "$expected" ]; then
  expected_commit="$(git rev-parse --verify --end-of-options "${expected}^{commit}")"
  if [ "$subject_commit" != "$expected_commit" ]; then
    echo "mainline audit failed: $subject resolves to $subject_commit, expected $expected_commit" >&2
    exit 1
  fi
fi

if ! git merge-base --is-ancestor "$subject_commit" "$main_commit"; then
  echo "mainline audit failed: $subject_commit is not reachable from $main_ref ($main_commit)" >&2
  exit 1
fi

printf 'mainline audit passed: subject=%s main=%s\n' "$subject_commit" "$main_commit"
