#!/bin/bash
adirBase="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../.. && pwd )"
source "$adirBase/schemes/versions.sh"

rdirScript=$(dirname "$1")
adirScript=$( cd "$rdirScript" &&  pwd )
#echo including library path "$adirScript"

# TODO: fix:
#   bash schemes/chibi/run-script.sh test/compat1/prog.scm
#     WARNING: exception inside undefined operator: library
#     ERROR on line 4 of file /home/jeff/srchome/src/scheme-lsp/scheme-docker-test/test/compat1/foo.sld: unexpected define: (define (ok)

docker run -it -v$(pwd):$(pwd) -w$(pwd) \
    -eCHIBI_MODULE_PATH="$adirScript" \
    $image_chibi:$version_chibi \
    /usr/local/bin/scheme-r7rs "$@"
