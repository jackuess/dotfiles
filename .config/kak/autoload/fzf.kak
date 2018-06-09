def -docstring 'invoke fzf to open a file' \
  fzf-file %{ %sh{
    if [ -z "$TMUX" ]; then
      echo echo only works inside tmux
    else
      FILE=$(rg --files | fzf-tmux -d 15)
      if [ -n "$FILE" ]; then
        printf 'eval -client %%{%s} edit %%{%s}\n' "${kak_client}" "${FILE}" | kak -p "${kak_session}"
      fi
    fi
} }

def -docstring 'invoke fzf to select a buffer' \
  fzf-buffer %{ %sh{
    if [ -z "$TMUX" ]; then
      echo echo only works inside tmux
    else
      BUFFER=$(printf %s\\n "${kak_buflist}" | tr : '\n' | fzf-tmux -d 15)
      if [ -n "$BUFFER" ]; then
        echo "eval -client '$kak_client' 'buffer ${BUFFER}'" | kak -p ${kak_session}
      fi
    fi
} }
