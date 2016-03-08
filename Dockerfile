FROM resin/rpi-raspbian:jessie

MAINTAINER Jordan Crawford <jordan.crawford@me.com>

# Install rsync.
RUN apt-get update; apt-get install rsync

ENTRYPOINT ["rsync"]
CMD ["-aPv", "--delete", "/backupsource/", "/backupdest/"]
