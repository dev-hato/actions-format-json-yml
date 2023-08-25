#!/usr/bin/env bash

find . -name '*.json' -o -name '*.geojson' -exec yq -i -o json {} \;
find . -name '*.yaml' -o -name '*.yml' -exec yq -i {} \;
