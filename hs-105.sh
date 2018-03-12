#!/usr/bin/env bash

usage() {
	cat << EOM

This script sends predefined TCP packets to the passed ip to signal a TP-Link HS105 wifi smart switch to turn on or off.

Usage:
	$(basename $0) switch_ip on|off

Returns:
	Exits nonzero if the response from the switch is not received within 1 second or if it doesn't match the predefined "success" packet.

EOM
	exit 1;
}

if [ "$#" -ne 2 ]
then
	>&2 echo "Invalid number of arguments"
	usage;
fi

if ! which nc 2> /dev/null
then
	>&2 echo "Must have nc installed and in path"
	usage;
fi

SCRIPTDIR=$(dirname $0)
NCEXEC=$(which nc)

diff $SCRIPTDIR/hs-105-success-response.bin <($NCEXEC -w 1 $1 9999 < $SCRIPTDIR/hs-105-$2.bin) > /dev/null 2>&1

exit $?
