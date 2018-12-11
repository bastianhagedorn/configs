# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/bastian/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="blinks"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

######### MANUALLY ADDED
### ALIASES
alias ll='ls -alF'
alias vi='vim'
alias xopen='xdg-open'
alias agamemnon='ssh -i ~/.ssh/fuji b_hage09@agamemnon'
alias odroid='ssh odroid@128.176.106.8'
alias blue='ssh -i ~/.ssh/fuji odroid@129.215.91.70'
alias red='ssh -i ~/.ssh/fuji odroid@129.215.91.82'
alias moe='ssh -i ~/.ssh/fuji odroid@10.88.0.8'
alias ned='ssh -i ~/.ssh/fuji odroid@10.88.0.14'
alias gray='ssh -i ~/.ssh/fuji odroid@129.215.90.147'
alias fuji='ssh -i ~/.ssh/fuji v1bhaged@fuji.inf.ed.ac.uk'
alias suzuka='ssh -i ~/.ssh/fuji v1bhaged@suzuka.inf.ed.ac.uk'
alias monaco='ssh -i ~/.ssh/fuji v1bhaged@monaco.inf.ed.ac.uk'
alias spa='ssh -i ~/.ssh/fuji v1bhaged@spa.inf.ed.ac.uk'
alias avus='ssh -i ~/.ssh/fuji v1bhaged@avus.inf.ed.ac.uk'
alias tofu='ssh -i ~/.ssh/fuji v1bhaged@tofu.inf.ed.ac.uk'
alias michel='ssh -i ~/.ssh/fuji v1bhaged@michel.inf.ed.ac.uk'
alias tim='ssh -i ~/.ssh/fuji v1bhaged@tim.inf.ed.ac.uk'
alias beavis='ssh -i ~/.ssh/fuji bastian@192.168.0.101'
alias vpne='sudo openvpn --config ~/documents/vpne/Informatics-only-Forum.ovpn'
alias vpnm='sudo openconnect vpn.uni-muenster.de'
alias vpnibm='sudo openconnect bblab-external.ibm.com'
alias spell_de='aspell -l de_DE -t check'
alias arch_config='vim ~/documents/misc/config_arch.txt'
alias sergei='cat ~/documents/CHECKLIST.txt'
alias explore='~/development/exploration/executor/scripts/explore.py'
alias present='pdfpc -g '
alias clip='xsel -ib'

### ENV-VARS
# reduces timout between normal and edit mode in zsh
export KEYTIMEOUT=1
export PATH=/home/bastian/tools/scripts/common:$PATH
export PATH=/home/bastian/tools/scripts/lift:$PATH
export PATH=/home/bastian/publications/lift_stencil/artifact/scripts:$PATH
export PATH=/home/bastian/.gem/ruby/2.3.0/bin:$PATH
export PATH=/home/bastian/development/lift/scripts/compiled_scripts:$PATH
export PATH=/home/bastian/.local/bin:$PATH
export PATH=/home/bastian/tools/ppcg-fork/ppcg:$PATH
export PATH=/home/bastian/publications/lift_stencil/measurements/ppcg/scripts:$PATH
export PATH=/home/bastian/repos/liftstencil-cgo2018-artifact/scripts:$PATH
export PATH=/home/bastian/.gem/ruby/2.4.0/bin:$PATH
export EDITOR=/usr/bin/vim
export BROWSER=firefox
#export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-jetbrains
export LIFT_PLATFORM=2
export LIFT=/home/bastian/development/lift/
export EXECUTOR=/home/bastian/development/exploration/executor
export RED=129.215.91.82
export MOE=10.88.0.8
export NED=10.88.0.14
export BLUE=129.215.91.70
export GRAY=129.215.90.147
export ATF=/home/bastian/repos/atf/pvs-pjs-ss17/atfc/build
export LD_LIBRARY_PATH=/home/bastian/tools/llvm-3.7.0/install/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/home/bastian/development/benchmarks/Halide/bin:$LD_LIBRARY_PATH
export CPLUS_INCLUDE_PATH=/home/bastian/development/benchmarks/Halide/build/include:$CPLUS_INCLUDE_PATH
export C_INCLUDE_PATH=/home/bastian/development/benchmarks/Halide/build/include:$CPLUS_INCLUDE_PATH
# fixed sbt error -- was showing no colors
export TERM=xterm-color
# CGO18 artifact specifics
export PPCG=/home/bastian/tools/ppcg-fork/ppcg
export OCL_PLATFORM_ID=0
export OCL_DEVICE_ID=0
export ITERATIONS=2
export CLANG=/usr/bin/clang
export LLVM_CONFIG=/usr/bin/llvm-config

# to compile bs slides from michel
#export TEXINPUTS=".:/home/bastian/teaching/bs/uebung//:"

### ZSH VI and PROMPT
# vim keybinding
bindkey -v
# emacs style history search
bindkey '^r' history-incremental-search-backward
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
zle -N zle-line-init
zle -N zle-keymap-select

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-execute

[[ -s /home/bastian/.autojump/etc/profile.d/autojump.sh ]] && source /home/bastian/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u


PATH="/home/bastian/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/bastian/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/bastian/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/bastian/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/bastian/perl5"; export PERL_MM_OPT;
