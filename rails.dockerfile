FROM ruby:2.5.1
# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Set an environment variable where the Rails app is installed to inside of Docker image:
ENV RAILS_ROOT /var/www/meteor_backend_production
RUN mkdir -p $RAILS_ROOT

# Set working directory, where the commands will be ran:
WORKDIR $RAILS_ROOT

# Setting env up
ENV RAILS_ENV production
ENV RACK_ENV production
ENV DATABASE_URL postgres://postgres:postgres@db/meteor_backend_production
ENV SECRET_KEY_BASE bab167b5697eb945840e0b992899e445b53aaa590febd7e685af77801794d6e81c7b0c6a52ada4bc2e1ac3d196917e2dec14c4b9588cec0debbee75489a53fa4
ENV DEVISE_JWT_SECRET_KEY DEVISE_JWT_SECRET_KEY

# Adding gems
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install --jobs 20 --retry 5 --without development test

# Adding project files
COPY . .

EXPOSE 3001
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
