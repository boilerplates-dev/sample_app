FROM ruby:2.3.3

RUN apt-get update && apt-get install -y  --no-install-recommends \
    build-essential \
    libpq-dev \
    postgresql-client \
    libxml2-dev \
    libxslt1-dev \
    nodejs \
    libqt4-webkit \
    libqt4-dev xvfb \
&& rm -rf /var/lib/apt/lists/*

ENV APP_HOME /app
RUN mkdir $APP_HOME
VOLUME $APP_HOME
WORKDIR $APP_HOME

COPY Gemfile* ./
RUN bundle install

EXPOSE 3000

CMD bundle exec rails server --port=3000 --binding=0.0.0.0
