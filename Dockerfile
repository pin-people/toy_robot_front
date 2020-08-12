FROM ruby:2.7.0

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y yarn

RUN mkdir /robot_toy_web
WORKDIR /robot_toy_web

RUN echo 'gem: --no-ri --no-rdoc' > ~/.gemrc

COPY Gemfile /robot_toy_web/Gemfile
COPY Gemfile.lock /robot_toy_web/Gemfile.lock
RUN bundle install --without test --jobs 80

COPY . /robot_toy_web

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
RUN yarn install --check_files

# Start the main process.
CMD ["bin/rails", "server", "-b", "0.0.0.0", "-p", "3000"]
