source 'https://rubygems.org'
ruby '2.6.5'

gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.3'

gem 'http_accept_language'

gem 'slim-rails'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'

gem 'simple_form'

gem 'redis', '~> 4.0'
gem 'sidekiq', '~> 6.0'
gem 'sidekiq-failures', '~> 1.0'

gem 'bootsnap', '>= 1.4.2', require: false

# Active Storage on AWS S3 for production
gem "aws-sdk-s3", require: false

group :development, :test do
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'dotenv-rails'

  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'rspec-rails', '~> 3.8'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers'

  gem 'simplecov', require: false
end

group :development do
  gem 'web-console', '>= 3.3.0'
  
  gem 'rubocop', require: false
end
