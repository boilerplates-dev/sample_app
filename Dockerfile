FROM ruby:3.0.0

RUN apt-get update && apt-get install -y --no-install-recommends \
  apt-utils curl wget lsb-release less \
  && apt-get clean all

# For MySQL users
#
# RUN echo "deb http://repo.mysql.com/apt/debian/ $(lsb_release -cs) mysql-8.0" > /etc/apt/sources.list.d/mysql.list
# RUN apt-key adv --keyserver pgp.mit.edu --recv-keys 5072E1F5

# For PostgreSQL users
#
RUN echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/postgresql.list
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

# ARG DEBIAN_FRONTEND=noninteractive
# ENV TZ=Asia/Shanghai

RUN apt-get update && apt-get install -y --no-install-recommends \
  autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev \
  zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev \
  # libdb-dev mysql-community-client \
  libpq-dev postgresql-client-13 \
  git nodejs \
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
