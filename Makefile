#############################################################################
#
#    Filename: Makefile
#      Author: Chris Charles
#
# ---------------------------------------------------------------------------
#
#    Makefile for managing dotfile symlinks.
#
#############################################################################

all: links reload

links:
	if [ ! -e ~/.emacs ]; then ln -s `pwd`/emacs ~/.emacs; fi
	if [ ! -e ~/.Xdefaults ]; then ln -s `pwd`/Xdefaults ~/.Xdefaults; fi

reload:
	xrdb -merge ~/.Xdefaults

clean:
	rm -f *~
