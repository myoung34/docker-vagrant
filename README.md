## docker-vagrant

Useful for testing plugins against many vagrant versions.
Contains ruby, vagrant, and jenkins user. See tags for vagrant versions.
Example usage via Jenkins can [be found here](https://github.com/myoung34/vagrant-ovirt4/blob/master/Jenkinsfile)

### Build

1. `docker build . --build-arg vagrant_version=1.9.2`
1. `docker build . --build-arg vagrant_version=1.9.2 --build-arg jenkins_uid=999 --build-arg jenkins_gid=40`

### Run
```bash
docker run \
  -d \
  -v $(pwd):/opt/vagrant-plugin \
  myoung34/vagrant:1.9.1 \
  /bin/bash -ex \
    -c "cd /opt/vagrant-plugin; bundle install; bundle exec rspec"
```
