#!/bin/bash
#############################################################################
#
#    Filename: makelinks.sh
#      Author: Chris Charles
#
# ---------------------------------------------------------------------------
#
#    Link versioned dotfiles into the active user's home directory, creating
#    directories if necessary.
#
#############################################################################

BASEDIR=$(dirname $0 | xargs readlink -f)
EXIT_VALUE=0

DIRECTORIES=$(find $BASEDIR -type d \
	! -regex "\($BASEDIR\|.*\.git.*\)")

FILES=$(find $BASEDIR -type f \
    ! -regex "\(.*\.git.*$\|\.\|.*makelinks.sh\|$BASEDIR\)")

# Strip however many characters are contained in argument 1 from the
# beginning of argument 2. The characters do not need to match.
function strip {
	local PREFIX="$1"
	local STRING="$2"
	local PREFIX_LENGTH=$(echo "$PREFIX" | wc -c)

	echo "$STRING" | cut -c $(($PREFIX_LENGTH + 1))-
}

# Return 0 if argument 1 is already linked to argument 2.
function linked {
	local LINK="$1"
	local SOURCE="$2"

	if [ -L "$LINK" ]; then
		if [ "$(readlink $LINK)" = "$SOURCE" ]; then
			return 0
		fi
	fi

	return 1
}

# Make directories in home directory
for DIR in $DIRECTORIES; do
	FULLDIR="$HOME/.$(strip $BASEDIR $DIR)"

	if [ -e "$FULLDIR" ]; then
		if [ -d "$FULLDIR" ]; then
			echo "Directory $FULLDIR already exists"
		else
			echo -e "\e[91m$FULLDIR already exists," \
				"but is not a directory\e[0m" >&2
			EXIT_VALUE=1
		fi
	else
		if mkdir -p "$FULLDIR"; then
			echo -e "\e[92mCreated directory $FULLDIR\e[0m"
		else
			echo -e "\e[91mError creating directory $FULLDIR\e[0m" >&2
			EXIT_VALUE=1
		fi
	fi
done

for FILE in $FILES; do
	F=$(strip "$BASEDIR" "$FILE")
	SOURCE="$BASEDIR/$F"
	DESTINATION="$HOME/.$F"

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
