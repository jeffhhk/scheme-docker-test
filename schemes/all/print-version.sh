#!/bin/bash
adirBase="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../.. && pwd )"
source "$adirBase/schemes/versions.sh"

for impl in ${impls_of_scheme[@]}
do
    echo $impl scheme version:
    bash "$adirBase/schemes/$impl/print-version.sh"
done
