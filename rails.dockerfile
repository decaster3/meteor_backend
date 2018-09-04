FROM ruby:2.5.1-alpine
ENV RAILS_ENV production
ENV DATABASE_URL: postgresql://postgres:postgres@dbnet:5432/meteor_backend_production
COPY . /meteor_backend
WORKDIR /meteor_backend
RUN apk add --update build-base postgresql-dev tzdata && rm -rf /var/cache/apk/*
RUN bundle install
RUN bundle add tzinfo-data
RUN rails db:create db:migrate db:seed
