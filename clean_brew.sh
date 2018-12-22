#!/bin/bash

# brew cleanup script; reference: https://link.medium.com/j8ooHgKgRS
echo "==> Running brew update"
brew update
echo "==> Running brew upgrade"
brew upgrade
echo "==> Running brew cleanup"
brew cleanup -s
echo "==> Running brew cask cleanup"
brew cask cleanup
# now diagnotic
echo "==> Running brew doctor"
brew doctor
echo "==> Running brew missing"
brew missing
echo "==> Running brew prune"
brew prune
echo "==> Running apm upgrade"
apm upgrade -c false
