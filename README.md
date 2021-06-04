
# Synopsis

An empirical study of scheme implementations.  I'm curious about:

  - What do phrases like "mostly rnrs compliant" mean?
  - How can one write scheme code that can be reused across different popular scheme implementations?
  - How can one write FFI code that can be reused across different popular scheme implementations?
  - What runtime time and space tradeoffs are made by various implementations?
  - For simple operations that frequently present bottlenecks in economically prevalent situations, how does a best practices scheme implementation compare to a best practices implementation in say Scala, Python or C?

# List of scheme implementations

Currently scheme-docker-test supports the following scheme implementations:

| Implementation | scheme version | image | image version |
|---|---|---|---|
| Chez | 9.5.2 | weinholt/chezscheme | 9.5.2-threads |
| Chibi | 0.9.1 "fluoride" | schemers/chibi | 0 |
| Chicken | 5.2.0 (rev 317468e4) | schemers/chicken | 5 |
| Guile | 3.0.4 | schemers/guile | 3.0 |
| Loko | 0.8.0 | weinholt/loko | base |
| MIT Scheme | 11.1 | schemers/mit-scheme | 11 |
| Racket | v8.1 cs | racket/racket | 8.1-full |

See schemes/all/print-version.sh and schemes/versions.sh for up to date details.

# Prerequisites

Prerequisites are:

  - docker (tested with docker 20.10.6, build 370c289, and 20.10.6, build 8728dd2, on Ubuntu 20)
  - bash (tested with GNU bash, version 5.0.17)
  
Bash is used to invoke docker, so bash needs to be on the host machine.  (By the "host machine" we mean the machine where the code is checked out.)

Docker needs the ability to mount volumes between the host machine and the container.

# Coding conventions

The "public functions" take the form of bash scripts.  To the extent possible, the public functions attempt to conceal the compatibility-breaking characteristics of each scheme implementation.

To the extent possible, we seek to conceal the difference between interpreted and compiled code.

Explicit invocation of bash on files named .sh is used to avoid relying on the executable bit (which does not work on windows).

Bash scripts locate each other by relative paths, using BASH_SOURCE.

Mounting volumes between the host machine and the container is always done so that, to the extent possible, both paths are the same.

All docker images are currently found, not custom.  Docker images are required to have source code.  Custom docker images are for the time being out of scope.  When possible, smaller docker images are preferred.

# Public functions available

Public functions come in two varieties, one specific to one particular scheme implementation, and another which loops through all scheme-docker-test implementations.  For example, this adds two numbers in Chez Scheme:

    bash schemes/chez/eval-expr.sh "(+ 2 2)"

And this adds two numbers across the library of all schemes:

    bash schemes/all/eval-expr.sh "(+ 2 2)"

## eval-expr.sh

The command:

    bash schemes/all/eval-expr.sh "(+ 2 2)"

Produces:

    chez scheme evaluates:
    4
    chibi scheme evaluates:
    4
    chicken scheme evaluates:
    4
    guile scheme evaluates:
    4
    loko scheme evaluates:
    4
    mit scheme evaluates:
    4
    racket scheme evaluates:
    4

## run-script.sh

With test/helloworld1/prog.sls:

    (import)
    (write "hello world\n")

    (define (main args) 
        '()
            ; no-op
        )

The command:

    bash schemes/all/run-script.sh test/helloworld1/prog.sls 

produces:

    chez scheme evaluates:
    "hello world\n"
    chibi scheme evaluates:
    ERROR on line 2 of file test/helloworld1/prog.sls: undefined variable: write
    called from <anonymous> on line 1293 of file /usr/local/share/chibi/init-7.scm
    called from <anonymous> on line 280 of file /usr/local/share/chibi/init-7.scm
    called from <anonymous> on line 821 of file /usr/local/share/chibi/init-7.scm
    Searching for modules exporting write ...
    write is exported by:
    (chibi)
    (scheme r5rs)
    (scheme red)
    (scheme small)
    (scheme write)

    chicken scheme evaluates:
    CHICKEN
    (c) 2008-2020, The CHICKEN Team
    (c) 2000-2007, Felix L. Winkelmann
    Version 5.2.0 (rev 317468e4)
    linux-unix-gnu-x86-64 [ 64bit dload ptables ]

    Type ,? for help.
    ; loading test/helloworld1/prog.sls ...
    "hello world\n"#;1> 

    guile scheme evaluates:
    "hello world\n"
    loko scheme evaluates:
    An exception has been raised, but no exception handler is installed.
    The condition has 5 components:
    1. &who: write
    2. &message: "unbound identifier"
    3. &undefined &violation &serious
    4. &source-information
        file-name: "test/helloworld1/prog.sls"
        line: 2
        column: 1
    5. &trace
        form: #<syntax write>
    End of condition components.

    mit scheme evaluates:
    ;Warning: Reference to unbound variable: write
    ;Warning: Reference to unbound variable: define
    ;Warning: Reference to unbound variable: main
    ;Warning: Reference to unbound variable: args
    ;Warning: Reference to unbound variable: quote
    ;Unbound variable: write
    ;To continue, call RESTART with an option number:
    ; (RESTART 3) => Specify a value to use instead of write.
    ; (RESTART 2) => Define write to a given value.
    ; (RESTART 1) => Return to read-eval-print level 1.

    2 error> 
    End of input stream reached.
    racket scheme evaluates:
    default-load-handler: expected a `module' declaration, but found something else
    file: .../scheme-docker-test/test/helloworld1/prog.sls

As we can see, running a program is a deficiency of rnrs, as of r7rs-small.

A code generator to portably wrap main programs is planned for scheme-docker-test.

# Scheme implementation exercises

Each method of exercising scheme implementations are started using a file called test.sh.

Currently the test.sh invokes the public function that exercises all scheme-docker-test implementations.

The following exercises, WIP are provided:

| Exercise | Description |
|---|---|
| test/test-r7rs/test.sh | A set of ~600 unit tests designed to test conformance with r7rs-small |
| test/compat1/test.sh | An exercise designed to check a "defacto standard" behavior for library includes |
| test/prog1/test.sh | An exercise to start a main program |

More exercises are forthcoming.
