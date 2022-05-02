#!/bin/sh
apt install -y jq > /dev/null 2>&1
export DISK_SNAPSHOT_NAME_KNOLDUS=$(gcloud compute snapshots list --sort-by=~[creationTimestamp] --limit=1 --filter="name=knoldus" | awk 'NR==2{print $1; exit}')
jq -n --arg knoldus_snapshot_latest "$DISK_SNAPSHOT_NAME_KNOLDUS" '{"knoldus_snapshot_latest":$knoldus_snapshot_latest}'