#!/bin/bash
adirBase="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../.. && pwd )"

bash "$adirBase"/schemes/all/run-script.sh "$adirBase"/test/compat1/prog.scm
