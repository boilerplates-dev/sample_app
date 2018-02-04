FROM ruby:2.5.0

# For MySQL users
#
# RUN echo 'deb http://repo.mysql.com/apt/debian/ jessie mysql-5.6' > /etc/apt/sources.list.d/mysql.list
# RUN apt-key adv --keyserver pgp.mit.edu --recv-keys 5072E1F5

# RUN echo 'deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main' > /etc/apt/sources.list.d/postgresql.list
# RUN wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | apt-key add -

RUN apt-get update && apt-get install -y  --no-install-recommends \
    build-essential \
    # libpq-dev \
    # mysql-client-5.6 \ MySQL users
    # postgresql-client-9.6 \
    # libxml2-dev \
    # libxslt1-dev \
    nodejs \
    # libqt4-webkit \
    # libqt4-dev xvfb \
    less \
&& rm -rf /var/lib/apt/lists/*

ENV APP_HOME /app
ENV BUNDLE_PATH /gems
RUN mkdir $APP_HOME
VOLUME $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile* ./
RUN bundle install

EXPOSE 3000

CMD bundle exec rails server --port=3000 --binding=0.0.0.0
