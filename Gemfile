source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.3"
gem "rails","= 7.0.4.3"
gem "sprockets-rails"
gem "sqlite3", "= 1.6.2"
gem "puma",  "= 5.6.5"
gem "importmap-rails"
gem "turbo-rails", "= 1.4.0"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem "bootstrap",  '= 5.2.3'
gem "simple_form", '= 5.2.0'
gem "devise", "= 4.9.2"
gem "rqrcode", "~> 2.1"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem 'pry-rails', '= 0.3.9'
  gem "web-console"
	gem 'pry-awesome_print'
	gem "awesome_print"
	gem 'listen'
	gem 'spring'
	gem 'spring-watcher-listen'
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
