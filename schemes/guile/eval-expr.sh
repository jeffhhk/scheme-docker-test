#!/bin/bash
adirBase="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../.. && pwd )"
source "$adirBase/schemes/versions.sh"

expr="$@"
exprprint="(write $expr) (newline)"
docker run -it -v$(pwd):$(pwd) -w$(pwd) \
    $image_guile:$version_guile \
    /usr/local/bin/guile -c "$exprprint"
