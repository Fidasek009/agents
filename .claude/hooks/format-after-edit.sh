#!/bin/bash
set -euo pipefail

input_payload=$(cat)
file_path=$(printf '%s' "$input_payload" | jq -r '.tool_input.file_path // empty')

if [[ -z "$file_path" || ! -f "$file_path" ]]; then
  exit 0
fi

run_if_available() {
  local binary_name="$1"
  shift

  if command -v "$binary_name" >/dev/null 2>&1; then
    "$@"
  fi
}

run_first_available() {
  while [[ $# -gt 0 ]]; do
    local binary_name="$1"
    shift
    local command_string="$1"
    shift

    if command -v "$binary_name" >/dev/null 2>&1; then
      eval "$command_string"
      return 0
    fi
  done

  return 0
}

case "$file_path" in
  *.js|*.jsx|*.ts|*.tsx|*.mjs|*.cjs|*.json|*.md|*.css|*.scss|*.html|*.yml|*.yaml)
    run_first_available \
      biome "biome format --write \"$file_path\"" \
      prettier "prettier --write \"$file_path\""
    ;;
  *.py)
    run_first_available \
      ruff "ruff format \"$file_path\"" \
      black "black \"$file_path\""
    ;;
  *.sh|*.bash|*.zsh)
    run_if_available shfmt shfmt -w "$file_path"
    ;;
esac

exit 0