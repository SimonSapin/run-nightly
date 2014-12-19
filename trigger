#!/bin/sh
MASTER_TREE=$(git cat-file commit master | head -1 | cut -d' ' -f2)
COMMIT_MESSAGE="Trigger a new build: $(date -Iseconds)"
NEW_COMMIT=$(git commit-tree $MASTER_TREE -p master -m "$COMMIT_MESSAGE")
git update-ref refs/heads/nightly $NEW_COMMIT
git push -qf origin nightly:nightly
