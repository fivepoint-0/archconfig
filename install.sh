#!/bin/bash

function checkbox_result {
  if $1; then echo -n '[x]'; else echo -n '[XXXXXXX]'; fi;
}

echo "Welcome to the installation"
echo ""
echo "Installing packages..."

while read p; do 
  (pacman -Qq | grep $p 1>/dev/null) && echo [*] $p || (echo [x] $p && pacman -S --noconfirm $p 2>/dev/null)
done < packages

#cat packages | xargs -I{} checkbox_result echo Installing {}...



