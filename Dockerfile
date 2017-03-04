FROM ruby:2.2.6
ARG vagrant_version
ARG jenkins_uid=997
ARG jenkins_gid=994
ENV VAGRANT_VERSION=$vagrant_version
ENV JENKINS_UID=$jenkins_uid
ENV JENKINS_GID=$jenkins_gid
RUN apt-get update && apt-get install -y sudo wget rsync
RUN groupadd -g $JENKINS_GID  jenkins
RUN groupadd -g 1994 admin
RUN useradd jenkins -u $JENKINS_UID -g $JENKINS_GID -G admin --shell /bin/bash --create-home
RUN useradd ubuntu -g admin --shell /bin/bash --create-home
RUN echo '%admin ALL=NOPASSWD: ALL' >> /etc/sudoers
RUN chown -R :admin /usr/local/bundle /usr/local/bin
RUN wget --quiet https://releases.hashicorp.com/vagrant/${VAGRANT_VERSION}/vagrant_${VAGRANT_VERSION}_x86_64.deb
RUN dpkg -i vagrant_${VAGRANT_VERSION}_x86_64.deb
RUN rm -rf vagrant_${VAGRANT_VERSION}_x86_64.deb
USER ubuntu
