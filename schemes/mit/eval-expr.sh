#!/bin/bash
adirBase="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../.. && pwd )"
source "$adirBase/schemes/versions.sh"

expr="$*"
exprprint="(write $expr)"
docker run -v$(pwd):$(pwd) -w$(pwd) \
    $image_mit:$version_mit \
    /usr/local/bin/scheme --quiet --eval "$exprprint"
# work around no output: (newline) (display (integer->char 10))
echo
