#!/usr/bin/zsh

# Enable colours
autoload -U colors && colors
zmodload -i zsh/complist
alias ls="ls --color=auto"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Use Emacs
export EDITOR=gnuclient

# Enable completion
autoload -U compinit && compinit
zstyle ':completion:::::' completer _complete _approximate
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX + $#SUFFIX) / 3 )) )'
zstyle ':completion:*:descriptions' format "- %d -"
zstyle ':completion:*:corrections' format "- %d - (errors %e})"
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose yes

# Save history
HISTSIZE=1024
HISTFILE=~/.zsh_history
SAVEHIST=1024

# If in a git repository, what branch are we on?
__git_ps1() {
    if git rev-parse --git-dir >/dev/null 2>&1; then
        local branch=$(git symbolic-ref HEAD | cut -d'/' -f3)
        echo " git:$branch"
    fi
}

precmd() {
    # Prompt components...
    user="%{$fg[blue]%}%n%{$reset_color%}"
    host="%{$fg[green]%}%m%{$reset_color%}"
    cwd="%{$fg[yellow]%}%~%{$reset_color%}"
    retval="%(?.%{$fg_bold[black]%}.%{$fg[red]%})(%?)%{$reset_color%}"
    ps="
%{$fg_bold[black]%}>%{$reset_color%} "
    gitbranch="%{$fg[cyan]%}$(__git_ps1)%{$reset_color%}"

    # ...and the main prompt itself
    export PS1="$user $host $cwd$gitbranch $retval$ps"
}
