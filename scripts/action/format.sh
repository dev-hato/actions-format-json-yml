#!/usr/bin/env bash

current_diff=""

for _ in $(seq 10); do
	find . \( -name '*.json' -o -name '*.geojson' \) -not -path 'node_modules/' -exec yq -i -o json {} \;
	find . \( -name '*.yaml' -o -name '*.yml' \) -not -path 'node_modules/' -exec yq -i {} \;
	git add -A
	previous_diff="$current_diff"
	current_diff="$(git diff --cached)"
	if diff -u <(echo "$previous_diff") <(echo "$current_diff"); then
		exit
	fi
done
