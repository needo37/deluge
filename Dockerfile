FROM debian:jessie
MAINTAINER needo <needo@superhero.org>
ENV DEBIAN_FRONTEND noninteractive

# Fix a Debianism of the nobody's uid being 65534
RUN usermod -u 99 nobody
RUN usermod -g 100 nobody

RUN apt-get update -q
RUN apt-get install -qy deluged deluge-web

#Path to a directory that only contains the deluge.conf
VOLUME /config
VOLUME /downloads

EXPOSE 8112
EXPOSE 58846

ADD start.sh /start.sh

# Let's not run deluge as root
USER nobody
CMD ["/bin/bash", "/start.sh"]
