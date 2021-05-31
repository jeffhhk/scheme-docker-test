#!/bin/bash
adirBase="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../.. && pwd )"
source "$adirBase/schemes/versions.sh"

rdirScript=$(dirname "$1")
adirScript=$( cd "$rdirScript" &&  pwd )
#echo including library path "$adirScript"

docker run -it -v$(pwd):$(pwd) -w$(pwd) \
    -ePLTCOLLECTS="$adirScript":/usr/share/racket/collects \
    $image_racket:$version_racket \
    /usr/bin/racket "$@"