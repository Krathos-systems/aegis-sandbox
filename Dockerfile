FROM debian:stable-slim

RUN apt-get update && apt-get -y full-upgrade \
 && apt-get install -y --no-install-recommends curl git vim ca-certificates \
 && rm -rf /var/lib/apt/lists/*

COPY motd /etc/motd
# docker exec doesn't go through PAM login, so print the MOTD from bashrc
RUN echo '[ -n "$PS1" ] && cat /etc/motd' >> /etc/bash.bashrc

WORKDIR /root
CMD ["sleep", "infinity"]
