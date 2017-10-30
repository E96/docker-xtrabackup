FROM phusion/baseimage
MAINTAINER Alex Salt <alex.salt@e96.ru>

ENV KEYID 8507EFA5
RUN apt-key adv --keyserver keys.gnupg.net --recv-keys $KEYID
RUN echo "deb http://repo.percona.com/apt "$(lsb_release -sc)" main" | tee /etc/apt/sources.list.d/percona.list
RUN apt-get update -qq && apt-get install -y percona-xtrabackup

COPY send-backup.sh /usr/local/bin/
COPY recv-backup.sh /usr/local/bin/
