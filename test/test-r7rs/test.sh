#!/bin/bash
adirBase="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../.. && pwd )"

bash "$adirBase"/schemes/all/run-script.sh "$adirBase"/test/test-r7rs/prog.scm
