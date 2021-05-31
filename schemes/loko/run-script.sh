#!/bin/bash
adirBase="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../.. && pwd )"
source "$adirBase/schemes/versions.sh"

rdirScript=$(dirname "$1")
adirScript=$( cd "$rdirScript" &&  pwd )
#echo including library path "$adirScript"

# https://scheme.fail/
# https://scheme.fail/manual/loko.html
docker run -it -v$(pwd):$(pwd) -w$(pwd) \
    -eLOKO_LIBRARY_PATH="$adirScript" \
    $image_loko:$version_loko \
    --program "$@"
