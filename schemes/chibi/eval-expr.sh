#!/bin/bash
adirBase="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../.. && pwd )"
source "$adirBase/schemes/versions.sh"

expr="$*"
exprprint="(define (main . args) (write "$expr") (newline))"
docker run -it -v$(pwd):$(pwd) -w$(pwd) \
    $image_chibi:$version_chibi \
    /usr/local/bin/scheme-r7rs -e "$exprprint"
