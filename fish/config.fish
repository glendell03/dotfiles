if status is-interactive
    # Commands to run in interactive sessions can go here

    alias git-log="git log --graph --abbrev-commit --decorate --first-parent"

    alias ls='eza --icons'
    alias ll='ls -l --grid --git -@ --no-user --group-directories-first'
    alias la='ll -a'
    alias lt='ll --git-ignore -T --level=2'
    alias ltt='lt -T --level=3'
    alias lttt='ltt -T --level=4'

    alias v='nvim'
    alias x='hx'

    alias cargo-update="cargo install $(cargo install --list | egrep '^[a-z0-9_-]+ v[0-9.]+:$' | cut -f1 -d' ')"

    function lg
        set -x LAZYGIT_NEW_DIR_FILE ~/.lazygit/newdir

        lazygit $argv

        if test -f $LAZYGIT_NEW_DIR_FILE
            cd (cat $LAZYGIT_NEW_DIR_FILE)
            rm -f $LAZYGIT_NEW_DIR_FILE >/dev/null
        end
    end

    starship init fish | source
end
