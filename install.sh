#!/usr/bin/env bash
# Installs the security-skill into the user's Claude Code skills directory.
# Works on Linux and macOS (and Git Bash / WSL on Windows).
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$SCRIPT_DIR/security-skill"
DEST="${HOME}/.claude/skills"

if [ ! -d "$SRC" ]; then
  echo "Error: cannot find skill source at $SRC" >&2
  exit 1
fi

mkdir -p "$DEST"

# Remove any previous install so stale files don't linger.
if [ -d "$DEST/security-skill" ]; then
  echo "Removing existing install at $DEST/security-skill"
  rm -rf "$DEST/security-skill"
fi

cp -r "$SRC" "$DEST/"

echo "Installed security-skill to $DEST/security-skill"
echo "Start a new Claude Code session and run: /security-skill"
