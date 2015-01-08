# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

if Rails.env.production?
  ENV['SC_REDIRECT'] = 'http://stere-o-gram.herokuapp.com/callback'
else
  ENV['SC_REDIRECT'] = 'http://localhost:3000/callback'
end
