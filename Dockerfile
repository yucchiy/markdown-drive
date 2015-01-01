FROM yucchiy/ruby:2.1.5

RUN \
    apt-get install -yq --force-yes mysql-client-5.5 libmysqlclient-dev nodejs imagemagick libmagickwand-dev && \
    apt-get clean

WORKDIR /app
RUN mkdir -p /app
COPY ./Gemfile /app/Gemfile
RUN bash -l -c 'bundle install'

COPY ./ /app

EXPOSE 3000
CMD bash -l -c 'bundle exec rails s'

