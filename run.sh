#!/bin/bash

function mountDrive {
	local DRIVETYPE=$1;
	local DRIVEOPTIONS=$2;
	local MOUNTPT=$3;
	echo "Mounting $DRIVETYPE. Options: $DRIVEOPTIONS. Mount at: $MOUNTPT.";

	case $DRIVETYPE in
		AFP)
			mount_afp $DRIVEOPTIONS $MOUNTPT
			;;
		USB)
			mount $DRIVEOPTIONS $MOUNTPT
			;;
		*)
			echo "Unknown drive type!";
			exit 1;
	esac
}

# Check if environment variables are defined.
if [ -z "${SOURCE_TYPE}" ]; then
	echo "The required environment SOURCE_TYPE is not defined.";
	exit 1;
fi

if [ -z "${SOURCE_OPTIONS}" ]; then
        echo "The required environment SOURCE_OPTIONS is not defined.";
        exit 1;
fi

if [ -z "${DEST_TYPE}" ]; then
        echo "The required environment DEST_TYPE is not defined.";
        exit 1;
fi

if [ -z "${DEST_OPTIONS}" ]; then
        echo "The required environment DEST_OPTIONS is not defined.";
        exit 1;
fi

if [ -z "${DEST_FOLDER}" ]; then
        echo "The required environment DEST_FOLDER is not defined.";
        exit 1;
fi

BACKUPSOURCE=/backupsource
BACKUPDEST=/backupdest

# Mount the source
mountDrive $SOURCE_TYPE $SOURCE_OPTIONS $BACKUPSOURCE

# Mount the destination
mountDrive $DEST_TYPE $DEST_OPTIONS $BACKUPDEST

BACKUPFULLSOURCE=$BACKUPSOURCE/
BACKUPFULLDEST=$BACKUPDEST/$DEST_FOLDER/
echo "Drives mounted. Starting rsync from $BACKUPFULLSOURCE to $BACKUPFULLDEST.";

# Run a sync
rsync --size-only -aPv --delete $BACKUPFULLSOURCE $BACKUPFULLDEST
