#!/bin/bash
#############################################################################
#
#    Filename: makelinks.sh
#      Author: Chris Charles
#
#############################################################################

BASEDIR=$(dirname $0 | xargs readlink -f)
EXIT_VALUE=0

FILES=$(find $BASEDIR -maxdepth 1 \
    ! -regex "\(.*\.git$\|\.\|.*makelinks.sh\|$BASEDIR\)" \
    -exec basename {} \;)

# Return 0 if argument 1 is already linked to argument 2.
linked() {
	local LINK="$1"
	local SOURCE="$2"

	if [ -L "$LINK" ]; then
		if [ "$(readlink $LINK)" = "$SOURCE" ]; then
			return 0
		fi
	fi

	return 1
}

for FILE in $FILES; do
	SOURCE="$BASEDIR/$FILE"
	DESTINATION="$HOME/.$FILE"

	if [ -e "$DESTINATION" ]; then
		if linked $DESTINATION $SOURCE; then
			echo -e "$DESTINATION is already linked to $SOURCE"
		else
			echo -e "\e[91m$DESTINATION exists" \
				"and is not linked to $SOURCE\e[0m" >&2
			EXIT_VALUE=1
		fi
	else
		if ln -s "$SOURCE" "$DESTINATION"; then
			echo -e "\e[92m$SOURCE -> $DESTINATION\e[0m"
		else
			echo -e "\e[91mError linking $SOURCE to $DESTINATION\e[0m"
		fi
	fi
done

exit $EXIT_VALUE
