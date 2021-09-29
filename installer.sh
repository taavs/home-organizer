#!/bin/bash
#TODO: Add a json file with all the dotfiles entry that should be synchronized. 
#Should be easier to just iterate the json file and import/export logic inside a loop.

display_help()
{
    echo "TODO"
}

import_dotfiles()
{
    #VIM 
    VIMRC=~/.vimrc
    if [ -f "$VIMRC" ]; then
		echo "Copying .vimrc"
		cp $VIMRC ./stash/.vimrc
    else
		echo "No .vimrc found, skipping"
    fi
    #VIM PLUGS
    VIMPLUGS=~/.vim/plugins.vim
    if [ -f "$VIMPLUGS" ]; then
		echo "Copying vim plugins"
		cp $VIMPLUGS ./stash/plugins.vim
    else
		echo "No .vimrc found, skipping"
    fi
    #I3
    I3=~/.config/i3/config
    if [ -f "$I3" ]; then
		echo "Copying i3 config"
		cp $I3 ./stash/i3/config
    else
		echo "No .i3 config file found, skipping"
    fi
}

export_dotfiles()
{
    echo "TODO"
}

find_or_create_stash()
{
	echo "Welcome back, lets organize your home"
	
	STASH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
	STASH="${STASH}/stash"
	if [ ! -d "$STASH" ]; then
		echo "Creating stash folder at $STASH"
		mkdir ./stash
		mkdir ./stash/i3
		mkdir ./stash/i3status
	else
		echo "Stash folder found at $STASH"
	fi
}


find_or_create_stash

prompt="What would you like me to do?"
options=("Import" "Export" "Help")
PS3="$prompt"
select opt in "${options[@]}" "Quit"; do
    case "$REPLY" in 
    1) import_dotfiles;;
    2) export_dotfiles;;
    3) display_help;;
    $((${#options[@]}+1))) echo "Goodbye!"; break;;
    *) echo "Invalid option. Try another one.";continue;;
    esac
done
