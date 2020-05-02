FROM ruby:2.6.3
RUN apt-get update -y 
RUN apt-get install curl libcurl4 libcurl4-openssl-dev
RUN apt install -y graphviz
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g yarn 
RUN mkdir /accounts_keepr
WORKDIR /accounts_keepr
COPY Gemfile  /accounts_keepr/Gemfile
COPY Gemfile.lock  /accounts_keepr/Gemfile.lock
RUN bundle install
RUN yarn install
COPY . /accounts_keepr