FROM debian:stretch

RUN apt-get update && apt-get install -y curl gnupg2 apt-transport-https ca-certificates libx11-xcb1 libasound2

RUN curl -s https://updates.signal.org/desktop/apt/keys.asc > signal-repo.key \
  && apt-key add signal-repo.key

RUN echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" > \
    /etc/apt/sources.list.d/signal-xenial.list \
  && cat /etc/apt/sources.list.d/signal-xenial.list \
  && apt-get update \
  && apt-get install -y signal-desktop

ENTRYPOINT ["/usr/local/bin/signal-desktop"]

