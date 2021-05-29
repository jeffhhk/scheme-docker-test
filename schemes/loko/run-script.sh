#!/bin/bash
adirBase="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../.. && pwd )"
source "$adirBase/schemes/versions.sh"

# https://scheme.fail/
# https://scheme.fail/manual/loko.html
docker run -it -v$(pwd):$(pwd) -w$(pwd) $image_loko:$version_loko --program "$@"
