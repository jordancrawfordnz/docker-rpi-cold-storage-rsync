# Install's rsync and ExFAT support.

FROM resin/rpi-raspbian:jessie

MAINTAINER Jordan Crawford <jordan.crawford@me.com>

# Install rsync and the ability to use exfat drives.
RUN apt-get update; apt-get install rsync exfat-fuse

# Setup the mount point of the backup device.
RUN mkdir /backupdest

# Copy the run script.
ADD run.sh /root/run.sh

CMD ["/root/run.sh"]
