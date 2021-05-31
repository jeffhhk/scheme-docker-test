#!/bin/bash
adirBase="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../.. && pwd )"
source "$adirBase/schemes/versions.sh"

rdirScript=$(dirname "$1")
adirScript=$( cd "$rdirScript" &&  pwd )
#echo including library path "$adirScript"

# TODO: fix:
#
# bash schemes/mit/run-script.sh test/compat1/prog.scm
#     ;Unregistered import libraries: ((foo))

# no env var for loading path?
docker run -v$(pwd):$(pwd) -w$(pwd) \
    $image_mit:$version_mit \
    /usr/local/bin/scheme --batch-mode --nocore --load "$@"
