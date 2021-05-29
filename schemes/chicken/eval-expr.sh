#!/bin/bash
adirBase="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../.. && pwd )"
source "$adirBase/schemes/versions.sh"

docker run -it -v$(pwd):$(pwd) -w$(pwd) $image_chicken:$version_chicken /usr/local/bin/csi -p "$*"
