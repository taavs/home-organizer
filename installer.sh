#!/bin/sh
prompt="What would you like me to do?"
options=("Import" "Export" "Help")
echo "Welcome back, lets organize your home"
PS3="$prompt"
select opt in "${options[@]}" "Quit"; do
    case "$REPLY" in 
    1) echo "You picked $opt which is option 1";;
    2) echo "You picked $opt which is option 2";;
    3) echo "You picked $opt which is option 3";;
    $((${#options[@]}+1))) echo "Goodbye!"; break;;
    *) echo "Invalid option. Try another one.";continue;;
    esac
done