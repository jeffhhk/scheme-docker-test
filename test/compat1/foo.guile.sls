(library (foo (1 0))
    (export ok)
    (import (rnrs (6)))
    (define (ok) (write "ok (guile implementation)"))
)