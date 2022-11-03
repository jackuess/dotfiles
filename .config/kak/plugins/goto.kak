define-command -params 1.. \
    -shell-script-completion %{
        global -c "$@"
    } \
    goto-gtag %{
        evaluate-commands %sh{
            tmp=$(mktemp -t kak-goto-XXX)
            trap "rm $tmp" EXIT

            tmux display-popup -E -h90% -w90% sh -c '
                fzfcmd() {
                    fzf --preview="bat --color=always \
                                       --highlight-line={2} {3}" \
                        --preview-window="+{2}-/2"
                }
                cd "$1"; shift
                tmp="$1"; shift
                global -ax "$@" | fzfcmd > "$tmp"' \
                '' "$(dirname $kak_buffile)" "$tmp" "$@"
            symbol_info=$(cat $tmp)
            [ -z "$symbol_info" ] && exit
            read -r symbol line_nr path line <<< "$symbol_info"
            printf "evaluate-commands -client $kak_client"
            printf '  edit -existing %s %s' "$path" "$line_nr"
        }
}

define-command -params .. goto-gtag-under-cursor %{
    evaluate-commands -draft %{
        execute-keys '<a-i>w'
        goto-gtag %arg{@} %val{selection}
    }
}

define-command goto-buffer %{
    try %{
        buffer %sh{
            tmp=$(mktemp -t kak-goto-XXX)
            trap "rm $tmp" EXIT

            eval "set -- ${kak_quoted_buflist:?}"
            tmux display-popup -E -h90% -w90% sh -c '
                fzfcmd() {
                    fzf --preview="bat --color=always {1}" \
                        --preview-window="+{2}-/2"
                }
                cd "$1"; shift
                out="$1"; shift
                printf "%s\n" "$@" | fzfcmd > "$out"' '' "$PWD" "$tmp" "$@"
            buffer=$(cat $tmp)
            printf '%s' "$buffer"
        }
    }
}

define-command goto-history %{
    execute-keys ':' %sh{
        tmp=$(mktemp -t kak-goto-XXX)
        trap "rm $tmp" EXIT

        eval "set -- ${kak_quoted_reg_colon}"
        tmux display-popup -E -h90% -w90% sh -c '
            out="$1"; shift
            printf "%s\n" "$@" | fzf --tac > "$out"' '' "$tmp" "$@"
        cat "$tmp"
    }
}
