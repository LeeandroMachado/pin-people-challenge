source "https://rubygems.org"

gem "rails", "~> 8.0.0"
gem "pg", "~> 1.5"
gem "puma", ">= 5.0"

gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false
gem "dotenv-rails"

gem "dry-validation"
gem "dry-container"
gem "dry-auto_inject"

# gem "bcrypt", "~> 3.1.7"
# gem "image_processing", "~> 1.2"
# gem "rack-cors"

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
