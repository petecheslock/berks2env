require 'spec_helper'

describe Convert do
  before :each do
    @convert = Convert.new('1.2.3', 'Berksfile.stub')
  end

  describe '#new' do
    it 'takes two parameters and returns a Convert object' do
        @convert.should be_an_instance_of Convert
    end
  end

  describe '#initialize' do
    it 'returns the correct branch name' do
      @convert.branch.should eql '1.2.3'
    end

    it 'returns the correct berkshelf lockfile' do
      @convert.berkslockfile.should eql 'Berksfile.stub'
    end

  end
end
