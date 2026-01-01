#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# === COLORS (Crimson & Blood Edition) ===
# 91 is Light Red, 31 is Dark Red, 95 is Magenta/Purple (for Umbreon vibes)
USERHOST_COLOR='\[\e[91m\]'    # Intense Red
DIR_COLOR='\[\e[31m\]'         # Dark Blood Red
PROMPT_COLOR='\[\e[1;91m\]'    # Bold Red for $
GIT_COLOR='\[\e[95m\]'         # Purple/Magenta (Matches Umbreon's "Darkness")
GIT_DIRTY='\[\e[91m\]🩸\[\e[0m\]' # Blood drop for dirty
RESET_COLOR='\[\e[0m\]'

# === GIT BRANCH + STATUS ===
parse_git() {
    local branch=$(git branch --no-color 2>/dev/null | sed -n '/\* /s///p')
    if [ -n "$branch" ]; then
        local dirty=""
        # Check for changes
        git diff-index --quiet HEAD -- 2>/dev/null || dirty="$GIT_DIRTY"
        # Changed the 🌱 to 🦇 for the night theme
        echo -e "${GIT_COLOR} 🦇 $branch$dirty${RESET_COLOR}"
    fi
}

# Dynamic title in Kitty / xterm
case "$TERM" in
    xterm*|rxvt*|kitty)
    PROMPT_COMMAND='PS1_TITLE="${PWD/#$HOME/~}"; echo -ne "\033]0;${PS1_TITLE}\007"'
    ;;
esac

# === PS1 (The "Cursed" Prompt) ===
# I kept your structure but swapped the symbols to be more "Gothic"
PS1="┏─${USERHOST_COLOR}(\u <${DIR_COLOR}\$(date +%H:%M)${USERHOST_COLOR}> \h)${RESET_COLOR}\n├─${USERHOST_COLOR}(<${DIR_COLOR}\w${USERHOST_COLOR}>\$(parse_git))${RESET_COLOR}\n┗─${PROMPT_COLOR} \$ ${USERHOST_COLOR}> ${RESET_COLOR}"

# PS2 (For multi-line commands) - Changed to Red/Gold like Umbreon rings
PS2="\[\e[93m\]{CODE<•>}\[\e[0m\] > "

[[ -r /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

if command -v fastfetch >/dev/null 2>&1; then
    echo "+=========================================================+"
    fastfetch
    echo "+=========================================================+"
fi

#####  EXPORTS  #####
export EDITOR=nvim
export FSCRIPT='$HOME/CRASHSTUFF'
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export GTK_THEME=Adwaita:dark
export GTK4_THEME=Adwaita:dark
export QT_QPA_PLATFORMTHEME="qt5ct"
export HYPRSHOT_DIR="$HOME/Pictures/Screenshots"

#####  CONFIG  #####
alias confnvim='nvim ~/.config/nvim/'
alias confwaybar='nvim ~/.config/waybar'
alias confbashrc='nvim ~/.bashrc && source ~/.bashrc'
alias nixconfig='sudo nvim /etc/nixos/configuration.nix'
alias confhypr='nvim ~/.config/hypr/'
alias conf='nvim ~/.config/'

#####  Ordinary Alias  #####
alias catt='highlight --replace-tabs=2 --out-format=ansi -l'
alias nn='nvim'
alias :q='exit'
alias nixswitch='sudo nixos-rebuild switch'

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
