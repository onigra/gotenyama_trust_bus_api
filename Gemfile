source 'https://rubygems.org'
ruby "2.4.0"

gem 'rails', '5.1.0beta1'
gem 'therubyracer', platforms: :ruby
gem "holiday_jp"
gem "puma"
gem "rambulance"

group :development do
  gem "guard"
  gem "guard-rails"
  gem "guard-rspec"
  gem "growl"
  gem "awesome_print"
end

group :development, :test do
  gem 'byebug'
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
  gem 'scrutinizer-ocular', require: false
end

group :production do
  gem "rails_12factor"
end
