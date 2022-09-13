#!/bin/bash

version=$(curl -fsSL "https://duplicacy.com/latest_web_version" | jq -r .stable)
[[ -z ${version} ]] && exit 0
version_json=$(cat ./VERSION.json)
jq '.version = "'"${version}"'"' <<< "${version_json}" > VERSION.json
