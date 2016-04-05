require 'spec_helper'

module Pronto
  describe Coffeelint do
    let(:coffeelint) { Coffeelint.new(patches) }
    let(:patches) { nil }

    describe '#run' do
      subject { coffeelint.run }

      context 'patches are nil' do
        it { should == [] }
      end

      context 'no patches' do
        let(:patches) { [] }
        it { should == [] }
      end

      context 'patch with a smell' do
        include_context 'test repo'

        let(:patches) { repo.diff('master') }

        its(:count) { should == 1 }

        its(:'first.msg') do
          should =~ /missing \)/
        end
      end
    end
  end
end