# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

plugins=(git
	archlinux
	colored-man-pages
	copybuffer
	docker
	docker-compose
	dotenv
	eza
	fancy-ctrl-z
	fzf
	git
	gitignore
	gitfast
	golang
	python
	rust
	safe-paste
	ssh
	sudo
	tmux
	)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias vi=nvim
alias vim=nvim
alias t=tmux
alias se=sudoedit
alias s=sudo
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'

export PATH=$PATH:/home/yt/.cargo/bin

export FZF_BASE=/usr/bin
export FZ_DEFAULT_COMMAND=rg

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
