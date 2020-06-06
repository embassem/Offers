# Offers

as of support iOS 10 
- Named Colors are not suported in Interface Builder, a color pallet will be used and included with the source code
- safe area not supported by default, a container with Properity Constrains was used


## Setup Symbolic link for git Hooks  

to link pre-Commit script  run this command from project root directory
to create a Symbolic link to a hook in git or replacr .git/hooks with ./hooks directory
``` ln -s -f ./hooks/pre-commit .git/hooks/pre-commit```
