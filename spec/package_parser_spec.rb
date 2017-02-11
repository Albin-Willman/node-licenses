require 'spec_helper'

describe NodeLicenseList::PackageParser do
  it 'It returns a package model' do
    Dir.chdir 'test_with_modules' do
      expect(described_class.run('node_modules/mod1')).to be_a(NodeLicenseList::Package)
    end
  end
end
