
impls_of_scheme=(
    chez
    chibi
    chicken
    guile
    loko
    mit
    racket
)

# https://github.com/weinholt/scheme-docker/blob/chezscheme/chezscheme/9.5.2-threads/Dockerfile
# looks better but no hub binaries? https://github.com/scheme-containers/chezscheme/blob/master/9.5-threads/Dockerfile
image_chez=weinholt/chezscheme
version_chez=9.5.2-threads

# https://github.com/scheme-containers/chibi/blob/master/head/Dockerfile
image_chibi=schemers/chibi
version_chibi=0

# https://github.com/scheme-containers/chicken/blob/master/5.2/Dockerfile
image_chicken=schemers/chicken
version_chicken=5

# https://github.com/scheme-containers/guile/blob/master/3.0/Dockerfile
image_guile=schemers/guile
version_guile=3.0

# https://github.com/weinholt/scheme-docker/blob/loko/loko/base/Dockerfile
image_loko=weinholt/loko
version_loko=base
# fortunately: updated regularly. unfortunately: previous versions not kept.

# https://github.com/scheme-containers/mit-scheme/blob/master/11/Dockerfile
image_mit=schemers/mit-scheme
version_mit=11

# https://github.com/samth/docker-racket-build
image_racket=racket/racket
version_racket=8.1
