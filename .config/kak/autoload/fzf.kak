define-command -docstring 'Invoke fzf to open a file' -params 0 fzf-edit %{
    evaluate-commands %sh{
        if [ -z "${kak_client_env_TMUX}" ]; then
            printf 'fail "client was not started under tmux"\n'
        else
            file="$(find . -type f |TMUX="${kak_client_env_TMUX}" fzf-tmux -d 15)"
            if [ -n "$file" ]; then
                printf 'edit "%s"\n' "$file"
            fi
        fi
    }
}

# the original version no longer works since kak_buflist is no longer ":" separated.
# this one works if you don't have single quote in file names.

def -override -docstring 'invoke fzf to select a buffer' \
  fzf-buffer %{eval %sh{
      BUFFER=$(printf %s\\n ${kak_buflist} | sed "s/'//g" |fzf-tmux -d 15)
      if [ -n "$BUFFER" ]; then
        echo buffer ${BUFFER}
      fi
} }
