#!/bin/bash
# This script sets up an offline directory structure for storing
# installation packages and helper scripts.
# It creates the following layout relative to the repository root:
#
# offline/
#   packages/    # place downloaded .deb files here
#   scripts/     # place helper installation scripts here
#
# If the directories already exist, they are left untouched.
# A README is created under offline/ explaining the purpose.

set -euo pipefail

# Determine repository root (directory of this script)
ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
OFFLINE_DIR="$ROOT_DIR/offline"

mkdir -p "$OFFLINE_DIR/packages"
mkdir -p "$OFFLINE_DIR/scripts"

# Create a README if it doesn't exist
README="$OFFLINE_DIR/README.md"
if [[ ! -f "$README" ]]; then
    cat <<'README_EOF' > "$README"
This directory stores resources for offline installation.

- **packages/** contains predownloaded .deb files or other archives.
- **scripts/** holds any helper scripts used to perform offline setup.

You can add `offline/**` to your `.gitignore` if you wish to keep these
files out of future commits.
README_EOF
fi

printf "Offline directory structure created at %s\n" "$OFFLINE_DIR"

