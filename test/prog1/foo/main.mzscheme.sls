#!r6rs
(library (foo)
    (export ok)
    (import (rnrs (6)))
    (define (ok) (write "ok (racket implementation)"))
)
