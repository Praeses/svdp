source 'https://rubygems.org'
ruby "1.9.3", engine: 'rbx', engine_version: "2.0.0.rc1"


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

gem 'devise'
gem 'haml-rails'

gem 'puma'
#gem 'protected_attributes'
gem 'grape'

gem 'bourbon'
gem 'sass-rails', '~> 4.0.0.rc1'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'

group :production do
  gem 'activerecord-postgresql-adapter'
end

# Use sqlite3 as the database for Active Record
group :development, :test do
  gem 'sqlite3'
  gem 'ffaker', require: false
  gem 'pry-rails'
  gem 'hirb', require: false
end


# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.0.1'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

