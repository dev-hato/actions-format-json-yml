#!/usr/bin/env bash

find . -not -path './.github/workflows/*' \( -name '*.json' -o -name '*.geojson' \) -exec yq -i -o json {} \;
find . -not -path './.github/workflows/*' \( -name '*.yaml' -o -name '*.yml' \) -exec yq -i {} \;
