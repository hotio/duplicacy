#!/bin/bash
set -exuo pipefail

version=$(curl -fsSL "https://duplicacy.com/latest_web_version" | jq -re .latest)
json=$(cat meta.json)
jq --sort-keys \
    --arg version "${version//v/}" \
    '.version = $version' <<< "${json}" | tee meta.json
