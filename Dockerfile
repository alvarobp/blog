FROM ruby:2.1.10

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

WORKDIR /app

COPY Gemfile Gemfile.lock /app/

RUN bundle install -j 3
