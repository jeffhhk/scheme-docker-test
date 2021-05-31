#!/bin/bash
adirBase="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../.. && pwd )"
source "$adirBase/schemes/versions.sh"

rdirScript=$(dirname "$1")
adirScript=$( cd "$rdirScript" &&  pwd )
#echo including library path "$adirScript"

docker run -it -v$(pwd):$(pwd) -w$(pwd) \
    -eCHICKEN_REPOSITORY_PATH="$adirScript" \
    $image_chicken:$version_chicken \
    /usr/local/bin/csi "$@"
