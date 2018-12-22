#!/bin/bash

# brew cleanup script; reference: https://link.medium.com/j8ooHgKgRS
brew update
brew upgrade
brew cleanup -s
brew cask cleanup
# now diagnotic
brew doctor
brew missing
apm upgrade -c false
