#!/bin/bash
adirBase="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../.. && pwd )"
source "$adirBase/schemes/versions.sh"

echo "$*" | docker run -i -v$(pwd):$(pwd) -w$(pwd) \
    $image_chez:$version_chez \
    scheme --quiet
