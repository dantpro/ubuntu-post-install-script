#!/bin/bash
# -*- Mode: sh; coding: utf-8; indent-tabs-mode: nil; tab-width: 4 -*-
#
# Authors:
#   Sam Hewitt <sam@snwh.org>
#
# Authors:
#   Igor Dyatlov <dyatlov.igor@gmail.com>
#
# Description:
#   A set of post-installation script for Ubuntu and Ubuntu-based distributions
#
# Legal Preamble:
#
# This project is free software; you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation; version 3.
#
# This project is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License along with
# this program; if not, see <https://www.gnu.org/licenses/gpl-3.0.txt>

# tab width
tabs 4
clear

# Import functions

dir=$(dirname "$0")

. $dir/functions/check
. $dir/functions/cleanup
. $dir/functions/configure
. $dir/functions/kernel
. $dir/functions/password
. $dir/functions/speedup
. $dir/functions/thirdparty
. $dir/functions/thirdparty-theme
. $dir/functions/update

# Fancy colorful echo messages
function echo_message(){
	local color=$1;
	local exp=$2;
	if ! [[ $color =~ '^[0-9]$' ]] ; then
		case $(echo -e $color | tr '[:upper:]' '[:lower:]') in
			# 0 = black
			title) color=0 ;;
			# 1 = red
			error) color=1 ;;
			# 2 = green
			info) color=2 ;;
			# 3 = yellow
			warning) color=3 ;;
			# 4 = blue
			question) color=4 ;;
			# 5 = magenta
			success) color=5 ;;
			# 6 = cyan
			header) color=6 ;;
			# 7 = white
			*) color=7 ;;
		esac
	fi
	tput bold;
	tput setaf $color;
	echo $exp;
	tput sgr0;
}

# Main
function main {
	echo_message title "Starting 'main' function..."
	# Draw window
	MAIN=$(eval `resize` && whiptail \
		--notags \
    --title 'Ubuntu Post-Install Script' \
    --menu '\nWhat would you like to do?' \
    --ok-button 'Run' \
    --cancel-button 'Quit' \
		$LINES $COLUMNS $(( $LINES - 12 )) \
    update 'Perform system update' \
    thirdparty 'Install third-party applications' \
    thirdparty-theme 'Install third-party theme' \
    configure 'Configure system' \
    kernel 'Update system kernel' \
    cleanup 'Cleanup the system' \
    speedup 'Speed up system' \
		3>&1 1>&2 2>&3)

  # check exit status
	EXITSTATUS=$?
	if [ $EXITSTATUS = 0 ]; then
		$MAIN
	else
		quit
	fi
}

# Quit
function quit {
	echo_message title "Starting 'quit' function..."
	if (whiptail --title "Quit" --yesno "Are you sure you want quit?" 8 64) then
		echo "Exiting..."
		echo_message success 'Thanks for using!'
		exit 99
	else
		main
	fi
}

# Welcome message
echo_message header "Ubuntu Post-Install Script"
# Run check
check

# Main
while :
do
	main
done

#END OF SCRIPT
