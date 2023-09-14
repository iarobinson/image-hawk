# Base image
FROM ruby:2.7

# Set working directory
WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y nodejs
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy application files
COPY . .

# Start Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
