source "https://rubygems.org"

gem "rails", "~> 7.2.2"
gem "pg", "~> 1.5"
gem "puma", ">= 5.0"

gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false
gem "dotenv-rails"

gem "dry-validation"
gem "dry-container"
gem "dry-auto_inject"
gem "activerecord-import"
gem "csv"
gem "will_paginate", "~> 4.0"

group :development, :test do
  gem "sqlite3", ">= 1.4"
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "faker"
  gem "pry-byebug"
  gem "simplecov"
  gem "rubocop-rspec", require: false
end
