

if [[ -d /usr/local/sbin ]]; then
    export PATH=/usr/local/sbin:$PATH
fi

export PATH=~/.local/bin:$PATH

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi


# Poetry python env variables
# export POETRY_CONFIG_DIR=~/.config/pypoetry
# export POETRY_CACHE_DIR=~/.cache/pypoetry

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
#     if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#       source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#     fi
#     ZSH_THEME="powerlevel10k/powerlevel10k"
if [[ $TERM_PROGRAM == "WarpTerminal" || $TERM_PROGRAM == "iTerm.app" ]]; then
    eval "$(starship init zsh)"
else
    ZSH_THEME="murilasso"
fi


if [[ -f ~/.dotfiles/zsh/aliases.sh ]]; then
  source ~/.dotfiles/zsh/aliases.sh
fi 

if [[ -f ~/.dotfiles/zsh/functions.sh ]]; then
  source ~/.dotfiles/zsh/functions.sh
fi
