#!/usr/bin/env bash
set -euo pipefail

main() {
  cd "$(dirname "$0")/../.."

  yarn --frozen-lockfile

  git submodule update --init

  # We need to fetch VS Code's deps for proper linting.
  cd lib/vscode
  yarn
  cd "$OLDPWD"

  yarn lint
}

main "$@"
