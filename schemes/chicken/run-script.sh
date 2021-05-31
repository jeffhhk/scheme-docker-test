#!/bin/bash
adirBase="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../.. && pwd )"
source "$adirBase/schemes/versions.sh"

rdirScript=$(dirname "$1")
adirScript=$( cd "$rdirScript" &&  pwd )
#echo including library path "$adirScript"

# TODO: fix:
#
# bash schemes/chicken/run-script.sh test/compat1/prog.scm
#     . . .
#     Error: (import) during expansion of (import ...) - cannot import from undefined module: foo


docker run -it -v$(pwd):$(pwd) -w$(pwd) \
    -eCHICKEN_REPOSITORY_PATH="$adirScript" \
    $image_chicken:$version_chicken \
    /usr/local/bin/csi "$@"
