#!/bin/bash
adirBase="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../.. && pwd )"
source "$adirBase/schemes/versions.sh"

rdirScript=$(dirname "$1")
adirScript=$( cd "$rdirScript" &&  pwd )
#echo including library path "$adirScript"

# no env var for loading path?
docker run -v$(pwd):$(pwd) -w$(pwd) \
    $image_mit:$version_mit \
    /usr/local/bin/scheme --batch-mode --nocore --load "$@"
