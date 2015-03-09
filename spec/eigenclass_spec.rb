require File.expand_path('../../lib/eigenclass', __FILE__)

RSpec.describe Eigenclass do
  subject { Object.new.extend(described_class) }

  it { should delegate_method(:ealias_method).to(:eigenclass).as(:alias_method) }
  it { should delegate_method(:eattr_accessor).to(:eigenclass).as(:attr_accessor) }
  it { should delegate_method(:eattr_reader).to(:eigenclass).as(:attr_reader) }
  it { should delegate_method(:eattr_writer).to(:eigenclass).as(:attr_writer) }
  it { should delegate_method(:edefine_method).to(:eigenclass).as(:define_method) }
  it { should delegate_method(:extended_modules).to(:eigenclass).as(:included_modules) }
  it { should delegate_method(:eigenclass_eval).to(:eigenclass).as(:instance_eval) }
  it { should delegate_method(:eigenclass_exec).to(:eigenclass).as(:instance_exec) }

  describe '#eigenclass' do
    it 'should return the eigenclass instance' do
      expected = class << subject; self end
      expect(subject.eigenclass).to eq(expected)
    end

    it 'should return the same object as singleton_class if that method exists' do
      if subject.respond_to?(:singleton_class)
        expect(subject.eigenclass).to eq(subject.singleton_class)
      end
    end
  end
end
