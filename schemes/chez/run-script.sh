#!/bin/bash
adirBase="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../.. && pwd )"
source "$adirBase/schemes/versions.sh"

rdirScript=$(dirname "$1")
adirScript=$( cd "$rdirScript" &&  pwd )
#echo including library path "$adirScript"

docker run -it -v$(pwd):$(pwd) -w$(pwd) \
    -eCHEZSCHEMELIBDIRS="$adirScript" \
    $image_chez:$version_chez \
    scheme --script "$@"
