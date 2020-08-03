FROM ruby:2.6.5-alpine3.11

ENV RUNTIME_PACKAGES="mysql-client mysql-dev nodejs tzdata vim yarn" \
    BUILD_PACKAGES="build-base curl-dev" \
    TZ=Asia/Tokyo

ENV RAILS_ROOT /Exposer
RUN mkdir $RAILS_ROOT
WORKDIR $RAILS_ROOT

ADD ./Gemfile $RAILS_ROOT/Gemfile
ADD ./Gemfile.lock $RAILS_ROOT/Gemfile.lock

RUN apk update && \
    apk upgrade && \
    apk add --no-cache ${RUNTIME_PACKAGES} && \
    apk add --virtual build-packages --no-cache ${BUILD_PACKAGES} && \
    gem install bundler && \
    bundle install && \
    apk del build-packages
COPY . $RAILS_ROOT
RUN mkdir -p tmp/sockets
RUN mkdir -p tmp/pid
EXPOSE 3000