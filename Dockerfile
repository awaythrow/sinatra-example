FROM ruby:2.7.2

RUN apt-get update -qq && \
	rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY Gemfile* .
RUN bundle install --deployment --without development test
COPY . .

EXPOSE 8080
CMD ["bin/puma", "-b", "tcp://0.0.0.0:8080"]
