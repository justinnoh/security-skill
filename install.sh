#!/usr/bin/env bash
# Installs the security-skill into the user's Claude Code skills directory.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST="${HOME}/.claude/skills"

mkdir -p "$DEST"
cp -r "$SCRIPT_DIR/security-skill" "$DEST/"

echo "Installed security-skill to $DEST/security-skill"
echo "Start a new Claude Code session and run: /security-skill"
