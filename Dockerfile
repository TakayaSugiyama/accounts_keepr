FROM ruby:2.6.6
RUN apt-get update -y
RUN apt-get install curl libcurl4 libcurl4-openssl-dev
RUN apt install -y graphviz
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g yarn
WORKDIR /app
ADD Gemfile  Gemfile
ADD Gemfile.lock  Gemfile.lock
RUN bundle install
RUN yarn install
ADD . .