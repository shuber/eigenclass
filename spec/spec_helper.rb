begin
  if ENV['CODECLIMATE_REPO_TOKEN']
    require 'codeclimate-test-reporter'
    CodeClimate::TestReporter.start
  else
    require 'simplecov'
    SimpleCov.start { add_filter('/vendor/bundle/') }
  end
rescue LoadError
  # Ignore when testing with Ruby 1.8.7
end

RSpec.configure do |config|
  config.raise_errors_for_deprecations!
end

RSpec::Matchers.define(:delegate_method) do |method|
  chain(:to) { |to| @to = to }
  chain(:as) { |as| @as = as }

  match do |subject|
    target = double "target"
    expect(subject).to receive(@to).and_return(target)

    args = double "args"
    block = proc { }
    value = double "value"
    expect(target).to receive(@as).with(args, &block).and_return(value)

    result = subject.send(method, args, &block)
    expect(result).to eq(value)
  end
end
