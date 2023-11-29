source ~/.bashrc

source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(oh-my-posh init zsh --config $HOME/.config/zsh/theme.omp.json)"

alias ls='exa --icons --group-directories-first'
alias cat='bat'