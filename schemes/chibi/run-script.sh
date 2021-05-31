#!/bin/bash
adirBase="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../.. && pwd )"
source "$adirBase/schemes/versions.sh"

rdirScript=$(dirname "$1")
adirScript=$( cd "$rdirScript" &&  pwd )
#echo including library path "$adirScript"

docker run -it -v$(pwd):$(pwd) -w$(pwd) \
    -eCHIBI_MODULE_PATH="$adirScript" \
    $image_chibi:$version_chibi \
    /usr/local/bin/scheme-r7rs "$@"
