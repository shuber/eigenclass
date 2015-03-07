if ENV['CODECLIMATE_REPO_TOKEN']
  require 'codeclimate-test-reporter'
  CodeClimate::TestReporter.start
else
  require 'simplecov'
  SimpleCov.start { add_filter('/vendor/bundle/') }
end

require 'shoulda'

RSpec.configure do |config|
  config.raise_errors_for_deprecations!
end
