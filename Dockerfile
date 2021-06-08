FROM ruby:latest

WORKDIR /app
COPY . /app

RUN bundle install


# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]