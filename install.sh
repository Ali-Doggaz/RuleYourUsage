#!/bin/bash

# RuleYourUsage skills installer for Claude Code
# Usage: ./install.sh [--global | target-directory]
# --global: Install to ~/.claude/skills/ (available in all projects)
# target-directory: Install to that project's .claude/skills/
# No args: Install globally

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_SOURCE="$SCRIPT_DIR/.claude/skills"

# Default to global install
if [ "$1" = "--global" ] || [ -z "$1" ]; then
    TARGET_BASE="$HOME/.claude/skills"
else
    TARGET_BASE="$1/.claude/skills"
fi

echo -e "${YELLOW}Installing RuleYourUsage skills for Claude Code...${NC}"

# Check skills directory exists
if [ ! -d "$SKILLS_SOURCE" ]; then
    echo -e "${RED}Error: No skills found in $SKILLS_SOURCE${NC}"
    exit 1
fi

# Install each skill
INSTALLED=0
for SKILL_DIR in "$SKILLS_SOURCE"/*/; do
    SKILL_NAME=$(basename "$SKILL_DIR")

    # Skip if no SKILL.md
    if [ ! -f "$SKILL_DIR/SKILL.md" ]; then
        echo -e "${YELLOW}Skipping $SKILL_NAME (no SKILL.md)${NC}"
        continue
    fi

    TARGET_SKILL_DIR="$TARGET_BASE/$SKILL_NAME"

    # Create target directory
    mkdir -p "$TARGET_SKILL_DIR"

    # Copy all .md files (SKILL.md and any subcommand files)
    cp "$SKILL_DIR"/*.md "$TARGET_SKILL_DIR/"

    # Copy src if exists
    if [ -d "$SCRIPT_DIR/src/$SKILL_NAME" ]; then
        mkdir -p "$TARGET_SKILL_DIR/src"
        cp -r "$SCRIPT_DIR/src/$SKILL_NAME/"* "$TARGET_SKILL_DIR/src/"
    fi

    echo -e "${GREEN}Installed /$SKILL_NAME${NC}"
    INSTALLED=$((INSTALLED + 1))
done

echo ""
echo -e "${GREEN}Installed $INSTALLED skill(s) to $TARGET_BASE${NC}"
echo "You can now use these skills in Claude Code!"
