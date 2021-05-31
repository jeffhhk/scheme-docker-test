#!/bin/bash
adirBase="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../.. && pwd )"
source "$adirBase/schemes/versions.sh"

rdirScript=$(dirname "$1")
adirScript=$( cd "$rdirScript" &&  pwd )
#echo including library path "$adirScript"

# seems to also work for loading libraries: -L "$adirScript"
#
# GUILE_AUTO_COMPILE=1 makes running faster, but makes it difficult to suppress
# text on stdout.  For simplicity, we allow run-script to run compiled code, but
# in case of any fuss specific to compilation, we disable it.
docker run -it -v$(pwd):$(pwd) -w$(pwd) \
    -eGUILE_AUTO_COMPILE=0 \
    -eGUILE_LOAD_PATH="$adirScript" \
    $image_guile:$version_guile \
    /usr/local/bin/guile --r6rs \
    "$@"
