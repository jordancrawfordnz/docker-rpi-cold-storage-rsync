# Docker RPi Cold Storage rsync

This syncs two provided directories (provided as a mount) using the ``rsync`` command.

To run:
``docker run --rm -t --name backup --volume /harddrive:/backupsource --volume /backupdrive:/backupdest jordancrawford/rpi-cold-storage-rsync``

## Attaching
The ``-t`` option allows you to use ``docker attach backup`` to see backup progress (detach with control a then control q).

## Custom Options
This runs the rsync command:
``rsync -aPv --delete /backupsource /backupdest`` by default.

You can override these, for example:
``docker run --rm -t --name backup --volume /harddrive:/backupsource --volume /backupdrive:/backupdest jordancrawford/rpi-cold-storage-rsync --help`` will display the rsync help menu.