FROM debian:stretch

# Refresh apt, and installed required dependencies.
RUN apt-get update && apt-get install -y curl gnupg2 apt-transport-https ca-certificates libx11-xcb1 libasound2

# Install GPG key for signal repo.
RUN curl -s https://updates.signal.org/desktop/apt/keys.asc > signal-repo.key \
  && apt-key add signal-repo.key

# Setup signal repo, and install signal.
RUN echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" > \
    /etc/apt/sources.list.d/signal-xenial.list \
  && cat /etc/apt/sources.list.d/signal-xenial.list \
  && apt-get update \
  && apt-get install -y signal-desktop

# Setup signal user.
# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
  mkdir -p /home/signal && \
  echo "signal:x:${uid}:${gid}:Signal,,,:/home/signal:/bin/bash" >> /etc/passwd && \
  echo "signal:x:${uid}:" >> /etc/group && \
  chown ${uid}:${gid} -R /home/signal

USER signal
ENV HOME /home/signal
CMD /usr/local/bin/signal-desktop
