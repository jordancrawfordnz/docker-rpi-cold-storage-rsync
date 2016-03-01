#!/bin/bash

# Mount the ExFAT volume.
mount /dev/sda1 /backupdest/

# Run a sync
rsync --size-only -aPv --delete /backupsource/$FOLDER/ /backupdest/$FOLDER/

# Unmount the ExFAT volume.
umount /dev/sda1
