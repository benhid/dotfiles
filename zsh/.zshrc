# Start profling by uncommenting the following line:
#zmodload zsh/zprof
# And adding `zprof` to the end of the file.

export PATH=$HOME/bin:/usr/local/bin:$PATH

# aliases
if [ -f ~/.config/zsh/aliases ]; then
    source ~/.config/zsh/aliases
fi

# attach to an ongoing tmux session or start a new one
# (with the exception of some IDEs, which doesn't play well with tmux)
# *https://wiki.archlinux.org/title/Tmux#Start_tmux_on_every_shell_login
if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ] && [ -z "${ZED_TERM}" ] && [ -z "${INTELLIJ_ENVIRONMENT_READER}" ]; then
    exec tmux new-session -A -s ${USER} >/dev/null 2>&1
fi

# history management
export HISTFILE=~/.zsh_history # location of history
export HISTSIZE=1000000 # number of lines kept in history
export SAVEHIST=1000000 # number of lines saved in the history after logout

setopt EXTENDED_HISTORY # record command start time
setopt INC_APPEND_HISTORY_TIME # append command to history file immediately after execution

# jump between words with option + arrow keys
bindkey -e
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# user configuration
add_to_path() {
  local p=$1
  if [[ ! "$PATH" == *"$p"* ]]; then
    export PATH="$p:$PATH"
  fi
}

add_to_path "/usr/local/sbin"

# Homebrew
export HOMEBREW_NO_AUTO_UPDATE=1

# Go development
export GOPATH="$HOME/go";
add_to_path "/usr/local/go/bin";
add_to_path "$GOPATH/bin";

# Rust development
add_to_path "$HOME/.cargo/bin";

# Python development
eval "$(pyenv init -)"

# starship.rs
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"
