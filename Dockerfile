FROM resin/rpi-raspbian:jessie

MAINTAINER Jordan Crawford <jordancrawf@ord.nz>

# Install rsync.
RUN apt-get update; apt-get install rsync

# Clean up.
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["rsync"]
CMD ["-aPv", "--delete", "/backupsource/", "/backupdest/"]
