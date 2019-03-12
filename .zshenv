typeset -U path
typeset -U manpath 
typeset -U infopath 

typeset -UT LD_LIBRARY_PATH ld_library_path :
typeset -UT ANDROID_AVD_HOME android_avd_home :
setopt histignorespace

# android stuff
path=(/opt/android-sdk/emulator/ $path)
android_avd_home=(/opt/android-sdk/system-images/android-24/default/armeabi-v7a/ $android_avd_home)

# tex stuff
manpath=(/usr/local/texlive/2018/texmf-dist/doc/man $manpath)
infopath=(/usr/local/texlive/2018/texmf-dist/doc/info $infopath)
path=(/usr/local/texlive/2018/bin/x86_64-linux $path)

# node stuff
export npm_config_prefix=~/Downloads/node_modules
export JUPYTER_PATH=(/home/min/Downloads/python3-virtual_env /home/min/Downloads/python3-virtual_env/lib/python3.7/lib-dynload /home/min/Downloads/python3-virtual_env/lib/python3.7/site-packages /home/min/Downloads/python3-virtual_env/lib/python3.7/site-packages/IPython $JUPYTER_PATH)

export GPG_TTY=$(tty)
path+=$(ruby -e 'print Gem.user_dir')/bin
export GEM_HOME=$HOME/.gem 
ld_library_path=(/usr/lib $ld_library_path)

export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

export CS125READ_PASS='***REMOVED***'

# opam configuration
test -r /home/min/.opam/opam-init/init.zsh && . /home/min/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# custom function
replace() {
    if (( $# > 3 )) || (( $# < 1 )) then
        echo "Usage: replace <word to be replaced> [word to replace with, omit to remove]"
    elif (( $# == 2 )) then
        ^$2^$3^
    else
        ^$2^^
    fi
}
