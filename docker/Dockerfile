FROM ruby:3.0.0

RUN apt-get update -qq && apt-get install -y postgresql-client
# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

ENV BUNDLER_VERSION=2.2.17
RUN gem install bundler --no-document -v 2.2.17

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle check || bundle install

COPY . /app


RUN chmod +x ./docker/entrypoint.sh
ENTRYPOINT ["./docker/entrypoint.sh"]

CMD ["rails", "server", "-b", "0.0.0.0"]