FROM google/cloud-sdk:272.0.0-alpine
RUN gcloud components install beta --quiet \
  && apk add --no-cache wget ca-certificates nodejs yarn \
  && cd /tmp \
  && wget https://download.docker.com/linux/static/stable/x86_64/docker-19.03.5.tgz \
  && tar -xvf docker*.tgz \
  && mv docker/docker /usr/local/bin \
  && apk del wget ca-certificates \
  && rm -rf /tmp/* /var/cache/apk/*
