require_relative '../lib/eigenclass'

RSpec.describe Eigenclass do
  subject { Object.new.extend(described_class) }

  it { should delegate_method(:eattr_accessor)
              .to(:eigenclass)
              .as(:attr_accessor) }

  it { should delegate_method(:eattr_reader)
              .to(:eigenclass)
              .as(:attr_reader) }

  it { should delegate_method(:eattr_writer)
              .to(:eigenclass)
              .as(:attr_writer) }

  it { should delegate_method(:edefine_method)
              .to(:eigenclass)
              .as(:define_method) }

  it { should delegate_method(:extended_modules)
              .to(:eigenclass)
              .as(:included_modules) }

  describe '#eigenclass' do
    it 'should return the eigenclass instance' do
      expected = class << subject; self end
      expect(subject.eigenclass).to eq(expected)
    end
  end

  describe '#eigenclass_eval' do
    it 'should evaluate in the eigenclass scope' do
      expectation = be_respond_to(:test)

      expect(subject).not_to expectation
      subject.eigenclass_eval { attr_reader :test }
      expect(subject).to expectation

      expect(subject.class.new).not_to expectation
    end
  end

  describe '#eigenclass_exec' do
    it 'should evaluate in the eigenclass scope' do
      expectation = be_respond_to(:test)

      expect(subject).not_to expectation
      subject.eigenclass_exec(:test) { |name| attr_reader name }
      expect(subject).to expectation

      expect(subject.class.new).not_to expectation
    end
  end
end
