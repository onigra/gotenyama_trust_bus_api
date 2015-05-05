source 'https://rubygems.org'
ruby "2.2.2"

gem 'rails', '4.2.1'
gem 'therubyracer', platforms: :ruby
gem "awesome_print"
gem "holiday_jp"
gem "puma"

group :development do
  gem "guard"
  gem "guard-rails"
  gem "guard-rspec"
  gem "growl"
end

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem "spring-commands-rspec"
  gem "rspec-rails"
  gem "rspec-parameterized"
  gem "rspec-json_matcher"
  gem "timecop"
  gem "pry-rails"
  gem "pry-byebug"
  gem "pry-stack_explorer"
  gem "pry-remote"
  gem "pry-doc"
end

group :test do
  gem 'coveralls', require: false
end

group :production do
  gem "rails_12factor"
end
