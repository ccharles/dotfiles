#!/bin/bash
#############################################################################
#
#    Filename: makelinks.sh
#      Author: Chris Charles
#
#############################################################################

FILES=$(find . -maxdepth 1 \
    ! -regex "\(.*\.git$\|\.\|.*makelinks.sh\)" \
    -exec basename {} \;)

for FILE in $FILES; do
	SOURCE="`pwd`/$FILE"
	DESTINATION="$HOME/.$FILE"

	if [ -e "$DESTINATION" ]; then
		echo "$DESTINATION already exists" >&2
	else
		echo "$SOURCE -> $DESTINATION"
		ln -s `pwd`/$FILE ~/.$FILE
	fi
done
