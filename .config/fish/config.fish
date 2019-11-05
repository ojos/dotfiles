# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_untrackedfiles '☡'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'

# bindings
fish_vi_key_bindings

# XDG
set -x XDG_CONFIG_HOME ~/.config
set -x XDG_CACHE_HOME ~/.cache

# direnv
eval (direnv hook fish)

# pyenv
set -x PYENV_ROOT ~/.pyenv
set -x PATH $PYENV_ROOT/bin $PATH
. (pyenv init - | psub)

# goenv
set -x GOENV_ROOT ~/.goenv
set -x PATH $GOENV_ROOT/bin $PATH
. (goenv init - | psub)
set -x PATH $GOROOT/bin $PATH
set -x PATH $GOPATH/bin $PATH

# peco
function fish_user_key_bindings
  bind \cr peco_select_history
  bind \cx\ck peco_kill
  bind \cx\cr peco_recentd
  bind \c] peco_select_ghq_repository
end

# ghq
set -x GHQ_SELECTOR peco

# dircolrs
eval (dircolors ~/.dir_colors/dircolors | head -n 1 | sed 's/^LS_COLORS=/set -x LS_COLORS /;s/;$//')

