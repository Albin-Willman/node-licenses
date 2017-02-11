require 'spec_helper'

describe NodeLicenseList::PackageFinder do
  it 'It returns an empty array if no folder is present' do
    Dir.chdir 'test_no_modules' do
      expect(NodeLicenseList::PackageFinder.run).to eq([])
    end
  end

  it 'It finds all packages in the node_modules folder' do
    Dir.chdir 'test_with_modules' do
      expect(NodeLicenseList::PackageFinder.run.length).to eq(2)
    end
  end
end
