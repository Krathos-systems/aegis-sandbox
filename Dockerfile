FROM debian:stable-slim

# openssh-client provides ssh-keygen, which the aegis installer uses to verify the release signature
RUN apt-get update && apt-get -y full-upgrade \
 && apt-get install -y --no-install-recommends curl git vim ca-certificates openssh-client \
 && rm -rf /var/lib/apt/lists/*

ENV PATH="/root/.local/bin:${PATH}"
WORKDIR /root

# Claude Code first: the aegis installer only adds its plugin when `claude` is on PATH
RUN curl -fsSL https://claude.ai/install.sh | bash
RUN curl -fsSL https://krathos.systems/install.sh | AEGIS_REQUIRE_SIGNATURE=1 bash

COPY motd /etc/motd
# docker exec doesn't go through PAM login, so print the MOTD from bashrc
RUN echo '[ -n "$PS1" ] && cat /etc/motd' >> /etc/bash.bashrc

CMD ["sleep", "infinity"]
