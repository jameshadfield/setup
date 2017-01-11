#!/bin/bash
set -e
# Any subsequent(*) commands which fail will cause the shell script to exit immediately

xcode-select --install

echo "Setting up dotfiles"
tmpdir="dotfiles_"$( date "+%Y%b" )
echo "(Moving old dotfiles to ${tmpdir})"
# run in subshell to avoid changing directory permanently
(cd $HOME && mkdir ${tmpdir})
for file in ${HOME}/.{bashrc,bash_profile,exports,aliases,functions,gitattributes,gitconfig,inputrc,wgetrc}; do
	[ -r "$file" ] && mv $file ${HOME}/${tmpdir}
done
unset tmpdir
echo "(copying over new dotfiles)"
for file in dotfiles/.{bashrc,bash_profile,exports,aliases,functions,gitattributes,gitconfig,inputrc,wgetrc}; do
	[ -r "$file" ] && cp $file $HOME && echo "$file"
done




echo "Install Homebrew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing the following homebrew packages via Brewfile"
# https://robots.thoughtbot.com/brewfile-a-gemfile-but-for-homebrew
cat Brewfile
brew update
brew tap homebrew/bundle
brew bundle

echo "Setup some paths"
ln -f -s /usr/local/bin/raxmlHPC-PTHREADS-AVX /usr/local/bin/raxml

echo "installing node"
nvm install
# (nvm was installed by homebrew)

echo "Setup Ruby environment, including these gems:"
cat Gemfile
rbenv install 2.4.0
rbenv global 2.4.0
gem install bundler
ARCHFLAGS=-Wno-error=unused-command-line-argument-hard-error-in-future bundle install
rbenv rehash

echo "Setup Python environment"
pip install -r requirements.txt

echo "Setting up Atom"
apm install linter
apm install linter-eslint
apm install highlight-selected
