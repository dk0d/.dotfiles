alias l='ls -lGah'
alias la='ls -lGAh'
alias ll='ls -lGh'
alias lsa='ls -lGah'

alias duh='du -h -d 1 .'
alias duh_='du -h -d 1 . > foldersizes.txt &'

# Hipergator
alias slq='squeue -A woodard'
alias slqm='squeuemine'
alias hpi="srun --partition=hgp-dev --mem=4gb --ntasks=1 --cpus-per-task=8 --time=04:00:00 --pty bash -i"
alias igpu='srun --mem=8gb --nodes=1 --time=08:00:00 --tasks=1 --cpus-per-task=10 --partition=gpu --qos=woodard --gres=gpu:geforce:1 --pty -u bash -i'
alias igpu2='srun --mem=8gb --nodes=1 --time=08:00:00 --tasks=1 --cpus-per-task=10 --partition=gpu --qos=woodard --gres=gpu:geforce:2 --pty -u bash -i'
alias igpu4='srun --mem=8gb --nodes=1 --time=08:00:00 --tasks=1 --cpus-per-task=10 --partition=gpu --qos=woodard --gres=gpu:geforce:4 --pty -u bash -i'
alias sacctw='sacct -S 0501 -o JobIDRaw,JobName,User,NCPUS,AllocCPUS,MaxRSS,Reqtres,Elapsed -a -A woodard'
alias wgpu='watch -d -n 1 nvidia-smi'

# Utils
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias cd.='cd ..'
alias cd..='cd ..'
alias vi='nvim'

# headless initialization for AstroNvim
alias astroinit="nvim --headless -c 'autocmd User PackerComplete quitall'"

# legacy ANTLR stuff
# export CLASSPATH=".:/usr/local/lib/antlr-4.9-complete.jar:$CLASSPATH"
# alias antlr4='java -Xmx500M -cp "/usr/local/lib/antlr-4.9-complete.jar:$CLASSPATH" org.antlr.v4.Tool'
# alias grun='java org.antlr.v4.gui.TestRig'

alias jqt_start="jupyter qtconsole --style=monokai --JupyterWidget.include_other_output=True"

# Start ipython kernel
alias ipykernel="ipython kernel --ip=0.0.0.0"
# Connect to remote kernel

# Poetry (python)
alias poe='poetry run poe'
