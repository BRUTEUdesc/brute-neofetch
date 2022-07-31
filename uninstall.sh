#!/bin/bash

set -- $(locale LC_MESSAGES)
yesexpr="$1"; noexpr="$2"; yesword="$3"; noword="$4"
curren_path=$(pwd) 

ok="[OK]"
ast="[*]"
error="[X]"

if [[ $(command -v neofetch) =~ 'neofetch' ]]
then
    neofetch
fi

echo -e "\n$ast Desculpa, eu fiz meu melhor :'(\n"
sleep 1

if [[ -d "$HOME/.config/neofetch" ]]
then
    rm -rf $HOME/.config/neofetch
fi

if [[ -d "$HOME/.config/neofetch.bkp" ]]
then
    mv $HOME/.config/neofetch.bkp $HOME/.config/neofetch
fi

neofetch
