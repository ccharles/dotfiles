# README

This repository contains a number of useful dotfiles. I typically keep them
in `~/dotfiles/` and symlink them to my home directory using the
`makelinks.pl` script.

Directories in the dotfiles repository will be created as necessary. Files
and folders in the root of the repository will have a dot prefixed to their
names.

The `.ignore` file lists Perl-compatible regular expressions of files to
ignore when creating the links.

## Examples

    ~/dotfiles/zshrc           -> ~/.zshrc
    ~/dotfiles/emacs.d/init.el -> ~/.emacs.d/init.el
