#!/bin/zsh
for file in ~/.ssh/*.pub; do echo $file; ext=${file::-4}; ssh-add --apple-use-keychain $ext; done;
