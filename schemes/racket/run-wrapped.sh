#!/bin/bash
adirBase="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../.. && pwd )"
source "$adirBase/schemes/versions.sh"
source "$adirBase/schemes/util.sh"

impl_of_scheme=mzscheme

rdirScript=$(dirname "$1")
adirScript=$( cd "$rdirScript" &&  pwd )
#echo including library path "$adirScript"

rfileScript=$(add_impl "$1" "$impl_of_scheme")
shift
echo about to run "$rfileScript"

docker run -it -v$(pwd):$(pwd) -w$(pwd) \
    -ePLTCOLLECTS="$adirScript":/usr/share/racket/collects \
    $image_racket:$version_racket \
    /usr/bin/racket "$rfileScript" "$@"