#!/usr/bin/env bash
set -euo pipefail

password_file="${1:-password}"

if [[ ! -f "$password_file" ]]; then
  echo "File not found: $password_file" >&2
  exit 1
fi

awk -F: '$7 == "/bin/bash" { print $1 }' "$password_file"
