# Install's rsync.

FROM resin/rpi-raspbian:jessie

MAINTAINER Jordan Crawford <jordan.crawford@me.com>

# Install rsync and the ability to use exfat drives.
RUN apt-get update; apt-get install rsync

ENTRYPOINT ["rsync"]
CMD ["-aPv", "/backupsource/", "/backupdest/"]
