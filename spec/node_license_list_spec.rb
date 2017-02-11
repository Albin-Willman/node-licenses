require 'spec_helper'

describe NodeLicenseList do
  it 'has a version number' do
    expect(NodeLicenseList::VERSION).not_to be nil
  end

  it 'raises an error if no node modules is present' do
    Dir.chdir 'test_no_modules' do
      expect {
        NodeLicenseList::Main.run
        }.to raise_error('No node modules')
    end
  end

  it 'raises no error if node modules is present' do
    Dir.chdir 'test_with_modules' do
      NodeLicenseList::Main.run
    end
  end
end
