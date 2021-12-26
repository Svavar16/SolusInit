#!/bin/bash

echo "#####################################"
echo "This is an intallation file, designed for a clean startup of the Solus OS linux system"
echo "This will install and make so that the operating system is good to use with this one command"
echo "However, first we need to make sure that we can run this by making this file executable"
echo "And we do that by writing chmod 777 /.SolusInit.sh"
echo "Then we run it with /.SolusInit.sh"

echo "Starting intalling"

sudo install -y vscode git golang nodejs docker docker-compose kubectl zsh mono wget

echo "Finished with the installation"

echo "alias code=code-oss" >> ~/.zshrc
echo "export zshconf=code ~/.zshrc" >> ~/.zshrc

echo "Now installing oh-my-zsh"

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "updating the terminal with new prompt"

echo ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}\uE0A0 " >> ~/.zshrc
echo ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}" >> ~/.zshrc
echo ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!" >> ~/.zshrc
echo ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?" >> ~/.zshrc
echo ZSH_THEME_GIT_PROMPT_CLEAN="" >> ~/.zshrc

echo ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg_bold[red]%}‹" >> ~/.zshrc
echo ZSH_THEME_RUBY_PROMPT_SUFFIX="›%{$reset_color%}" >> ~/.zshrc

echo PROMPT='
%{$fg_bold[green]%}%~%{$reset_color%}$(git_prompt_info)$(kube_ps1) ⌚ %{$fg_bold[red]%}%*%{$reset_color%}
> ' >> ~/.zshrc

echo RPROMPT='$(ruby_prompt_info)' >> ~/.zshrc

echo "installing the powerline/fonts"

# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
fonts/./install.sh
# clean-up a bit
rm -rf fonts

echo "If you want more iformation then you can visit their github page here https://github.com/ohmyzsh/ohmyzsh"

echo "creating github key"

echo "you will be asked a few questions, just hit enter and it should be done"

ssh-keygen -t ed25519 -C "spg009@gmail.com"

eval "$(ssh-agent -s)"

echo "you should get something similar to this: Agent pid 32719"

ssh-add ~/.ssh/id_ed25519

echo "This should tell you that you added an identity"

cat ~/.ssh/id_ed25519.pub

echo "after this you should add the key that came up into your github:settings:SSH and GPG key"

echo "SolusInit is done, thanks for the patiance"
echo "#####################################"