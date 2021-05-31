;;  Validate "de-facto standard supported by most of the R6RS implementations"
;;
;;    http://www.schemeworkshop.org/2014/IndianaCSTR718.pdf
;;
;;        2.1.1 R6RS library
;;            The R6RS library system has rather fixed form. With the R6RS
;;            library form, the library (foo) would look like the following:
;;
;;            Listing 2: R6RS library form
;;              (library (foo)
;;                  (export bar)
;;                  (import (rnrs) (compat foo))
;;                (define bar (compat-foo-proc)))
;;
;;            An R6RS library name can only contain symbols and a version
;;            reference at the end of library name2
;;            , which must be a list of
;;            numbers. Both export and import forms must be present only
;;            once in respective order.
;;
;;            Here, the (compat foo) is a compatible layer of an
;;            implementation-dependent procedure. R6RS does not have the
;;            means to load implementation-specific code, however, there is a
;;            de-facto standard supported by most of the R6RS implementations
;;            listed on
;;            http://www.r6rs.org/implementations.html. If the
;;            implementation is Sagittarius Scheme, for example, then the filename of its (compat foo) library would be
;;            compat/foo.sagittarius.sls which could contain something like the following:
;;
;;            Listing 3: Compatible layer
;;              ;; compat/foo.sagittarius.sls
;;              (library (compat foo)
;;                  (export compat-foo-proc)
;;                  (import (sagittarius))
;;                (define compat-foo-proc
;;                  implementation-dependent-procedure))
;;
;;            If the library wants to provide a default procedure, then it needs
;;            to have compat/foo.sls as the default library file name. The
;;            implementations first try to resolve the library file name with its
;;            featured name then fall back to the default filename. This requires
;;            the same number of compatible layer library files as implementations that the library would support. Moreover, it is not guaranteed
;;            to be portable by the standard.

(import (foo))
(ok)
