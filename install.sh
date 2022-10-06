#!/bin/sh

set -eu

PARENT="$(d=${0%/*}/; [ "_$d" = "_$0/" ] && d='./'; cd "$d"; pwd)"
plugins_dir='plugins'
bin_dir='bin'
subcmd="${1:-auto-install}"
case "${subcmd}" in
    all|auto-install);;
    *) ${subcmd:+${subcmd}} ;;
esac

targets=$(
    find "${PARENT}/${plugins_dir}" -maxdepth 1 -type f -name 'pmo-*' |
        sed 's#^.*/##' |
        case "${subcmd}" in
            all)
                cat
                ;;
            auto-install)
                while IFS= read -r file; do
                    if type "${file#pmo-}" >/dev/null; then
                        printf '%s\n' "${file}"
                    fi
                done
                ;;
        esac |
        tr '\n' ':' | sed 's/:$//'
       )

printf '%s\n' "${targets}" |
    tr ':' '\n' |
    while IFS= read -r file; do
        cd "${PARENT}/${bin_dir}"
        if [ -L "${bin_dir}/${file}" ]; then
            inode_org="$(ls -di "${plugins_dir}/${file}" | cut -d ' ' -f 1)"
            inode_lnk="$(ls -di "$(readlink "../${bin_dir}/${file}")" 2>/dev/null | cut -d ' ' -f 1)"
            if [ "${inode_org}" -eq "${inode_lnk}" ] 2>/dev/null; then
                continue
            fi
        fi
        if ! (set -x; ln -s "../${plugins_dir}/${file}" "../${bin_dir}/"); then
            exit 1
        fi
    done
