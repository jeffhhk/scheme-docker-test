#!/bin/bash
adirBase="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../.. && pwd )"

bash "$adirBase"/schemes/racket/run-wrapped.sh "$adirBase"/test/prog1/prog.sls
echo
