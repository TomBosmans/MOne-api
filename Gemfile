source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'rails', '~> 6.0.2', '>= 6.0.2.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'jaf', git: 'https://github.com/TomBosmans/jaf.git'
gem 'fast_jsonapi', '~> 1.6.0', git: 'https://github.com/fast-jsonapi/fast_jsonapi'

group :development, :test do
  gem 'pry'
  gem 'annotate'
  gem 'faker', '~> 2.11.0'
  gem 'factory_bot_rails', '~> 5.1.1'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rspec-rails', '~> 4.0.0'
  gem 'shoulda-matchers', '~> 4.3.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
