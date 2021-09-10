#!/bin/sh

display_help()
{
    echo "TODO"
}

import_dotfiles()
{
    #Look for files in specific locations
    #.vimrc 
    VIMRC=~/.vimrc
    if [ -f "$VIMRC" ]; then
		echo "Copying .vimrc"
		cp ~/.vimrc ./stash/.vimrc
    else
		echo "No .vimrc found, skipping"
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
	else
		echo "Stash found at $STASH"
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
