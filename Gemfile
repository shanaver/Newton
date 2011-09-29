source 'http://rubygems.org'

#gem 'rails', '~> 3.1' upgrade to 3.1 once this is on a new server
gem 'rails', '3.0.3'

# for server compatibility
gem 'rack', '1.2.1'

gem 'jquery-rails'
gem 'devise'

gem 'postmark-rails'

gem 'ckeditor'#, '3.6.2' :git => 'https://github.com/galetahub/ckeditor.git'

gem 'paperclip'
# gem 'paperclip-aws'

# gem 'postmark-rails'

group :production do
  gem 'mysql', '2.8.1'
end

group :test, :development do
  gem 'ruby-mysql'
  gem 'capistrano'
  gem 'sqlite3-ruby', :require => 'sqlite3'
end
