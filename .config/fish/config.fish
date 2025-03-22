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

    set -gx PATH "/Users/glendell/.local/state/fnm_multishells/81158_1726751938303/bin" $PATH
    set -gx FNM_NODE_DIST_MIRROR "https://nodejs.org/dist"
    set -gx FNM_ARCH arm64
    set -gx FNM_VERSION_FILE_STRATEGY local
    set -gx FNM_DIR "/Users/glendell/.local/share/fnm"
    set -gx FNM_COREPACK_ENABLED false
    set -gx FNM_RESOLVE_ENGINES false
    set -gx FNM_MULTISHELL_PATH "/Users/glendell/.local/state/fnm_multishells/81158_1726751938303"
    set -gx FNM_LOGLEVEL info

    if test -d (brew --prefix)"/share/fish/completions"
        set -p fish_complete_path (brew --prefix)/share/fish/completions
    end

    if test -d (brew --prefix)"/share/fish/vendor_completions.d"
        set -p fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
    end

    starship init fish | source
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/glendell/Downloads/google-cloud-sdk/path.fish.inc' ]
    . '/Users/glendell/Downloads/google-cloud-sdk/path.fish.inc'
end
