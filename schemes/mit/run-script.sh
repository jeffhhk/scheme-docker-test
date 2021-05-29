#!/bin/bash
adirBase="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../.. && pwd )"
source "$adirBase/schemes/versions.sh"

docker run -v$(pwd):$(pwd) -w$(pwd) $image_mit:$version_mit /usr/local/bin/scheme --batch-mode --nocore --load "$@"
