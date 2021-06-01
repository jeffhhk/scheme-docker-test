
function add_impl() {
    rfile="$1"
    impl="$2"
    rfileNoext=${rfile%%.sls}
    printf "%s" "${rfileNoext}.${impl}.sls"
}
