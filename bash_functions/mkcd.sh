# executes mkdir with the given parameters and cds in the last directory specified
function mkcd {
    mkdir "$@" || return 1

    local lastdir
    for (( idx=$#; idx>0; idx-- )); do
        lastdir="${!idx}"
        if [[ ! "$lastdir" =~ ^- ]]; then
            break
        fi
    done
    cd "$lastdir"
}