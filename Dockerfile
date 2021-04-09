FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /RR-study
COPY Gemfile /RR-study/Gemfile
COPY Gemfile.lock /RR-study/Gemfile.lock
RUN bundle install
COPY . /RR-study


COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000


CMD ["rails", "server", "-b", "0.0.0.0"]
