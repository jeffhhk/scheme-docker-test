#!/bin/bash
adirBase="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../.. && pwd )"
source "$adirBase/schemes/versions.sh"

echo "(display (loko-version)) (newline)" | docker run -i -v$(pwd):$(pwd) -w$(pwd) \
    $image_loko:$version_loko \
    --script /dev/stdin
    
