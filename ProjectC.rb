gem_group :development, :test do
  gem 'foreman', '~> 0.87.1'
  gem 'hirb-unicode', '~> 0.0.5'
  gem 'rspec-rails', '~> 4.0'
  gem 'factory_bot_rails', '~> 5.1', '>= 5.1.1'
  gem 'faker', '~> 2.11'
  gem 'pry-rails', '~> 0.3.9'
end

after_bundle do
  application do <<-RUBY
    config.generators do |g|
      g.assets false
      g.helper false
    end
    RUBY
  end

  
  run "spring stop"

  git :init
  git add: '.'
  git commit: "-a -m 'Initial commit'"
end
