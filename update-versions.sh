#!/bin/bash
set -e
version=$(curl -fsSL "https://duplicacy.com/latest_web_version" | jq -re .stable)
json=$(cat VERSION.json)
jq --sort-keys \
    --arg version "${version//v/}" \
    '.version = $version' <<< "${json}" | tee VERSION.json
