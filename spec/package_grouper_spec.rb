require 'spec_helper'

describe NodeLicenseList::PackageGrouper do
  it 'It returns a hash' do
    list = [
      NodeLicenseList::Package.new('test1', 'mit', ''),
      NodeLicenseList::Package.new('test2', 'mit', ''),
      NodeLicenseList::Package.new('test3', 'apache', '')
    ]
    expected = {
      'mit' => ['test1', 'test2'],
      'apache' => ['test3']
    }
    expect(described_class.run(list)).to eq(expected)
  end
end
