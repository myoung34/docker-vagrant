FROM ruby:2.2.6
ARG vagrant_version
ENV VAGRANT_VERSION=$vagrant_version
RUN apt-get update && apt-get install -y sudo wget rsync
RUN groupadd -g 1994 admin
RUN useradd ubuntu -g admin --shell /bin/bash --create-home
RUN echo '%admin ALL=NOPASSWD: ALL' >> /etc/sudoers
RUN chown -R :admin /usr/local/bundle /usr/local/bin
RUN wget --quiet https://releases.hashicorp.com/vagrant/${VAGRANT_VERSION}/vagrant_${VAGRANT_VERSION}_x86_64.deb
RUN dpkg -i vagrant_${VAGRANT_VERSION}_x86_64.deb
RUN rm -rf vagrant_${VAGRANT_VERSION}_x86_64.deb
USER ubuntu
