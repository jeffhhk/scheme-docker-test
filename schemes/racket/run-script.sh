#!/bin/bash
adirBase="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../.. && pwd )"
source "$adirBase/schemes/versions.sh"

rdirScript=$(dirname "$1")
adirScript=$( cd "$rdirScript" &&  pwd )
#echo including library path "$adirScript"

# TODO: fix:
#
# bash schemes/racket/run-script.sh test/compat1/prog.scm
#     test/compat1/prog.scm:45:8: import: cannot find suitable library installed (exception: collection-path: collection not found

docker run -it -v$(pwd):$(pwd) -w$(pwd) \
    -ePLTCOLLECTS="$adirScript":/usr/share/racket/collects \
    $image_racket:$version_racket \
    /usr/bin/racket "$@"