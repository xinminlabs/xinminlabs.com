# setup our builder
FROM ruby:3.1.6-alpine AS middleman-builder
RUN apk update && apk add build-base git nodejs
WORKDIR /app

# Only do a bundle install if the gemfile changes
COPY Gemfile Gemfile.lock /app/
RUN bundle install
COPY . /app
RUN bundle exec middleman build

# Copy the resulting code to the nginx container
FROM nginx:1.20-alpine
COPY --from=middleman-builder /app/build /usr/share/nginx/html
