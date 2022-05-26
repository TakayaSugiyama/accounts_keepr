#syntax=docker/dockerfile:1.3-labs
FROM ruby:2.6.7
RUN <<EOF
apt-get update -y
apt-get install -y curl libcurl4 libcurl4-openssl-dev graphviz
EOF
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g yarn
WORKDIR /app
ADD Gemfile  Gemfile
ADD Gemfile.lock  Gemfile.lock
RUN bundle install
RUN yarn install
ADD . .
CMD ["rails", "server", "-b", "0.0.0.0"]
