FROM ruby:3.3

WORKDIR /srv/jekyll
COPY Gemfile Gemfile.lock ./
RUN bundle install

EXPOSE 8080
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--port", "8080", "--destination", "/tmp/jekyll-site", "--disable-disk-cache"]
