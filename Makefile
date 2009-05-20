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
	if [ ! -e ~/.emacs.d ]; then mkdir -p ~/.emacs.d; fi
	if [ ! -e ~/.emacs.d/init.el ]; then ln -s `pwd`/emacs.d/init.el ~/.emacs.d; fi
	if [ ! -e ~/.emacs.d/init.d ]; then ln -s `pwd`/emacs.d/init.d ~/.emacs.d; fi
	if [ ! -e ~/.Xdefaults ]; then ln -s `pwd`/Xdefaults ~/.Xdefaults; fi

reload:
	xrdb -merge ~/.Xdefaults

clean:
	rm -f *~
