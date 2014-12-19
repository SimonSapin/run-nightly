#!/bin/sh
cd $(dirname $0)
git fetch origin
MASTER_TREE=$(git cat-file commit origin/master | head -1 | cut -d' ' -f2)
COMMIT_MESSAGE="Triggering a new build at $(date -Iseconds)"
NEW_COMMIT=$(git commit-tree $MASTER_TREE -p master -m "$COMMIT_MESSAGE")
git update-ref refs/heads/nightly $NEW_COMMIT
git push -qf origin nightly:nightly
