module NodeLicenseList
  class PackageGrouper
    def self.run(package_list)
      package_list.inject({}) do |h, p|
        list = h[p.license] || []
        list << p.name
        h[p.license] = list
        h
      end
    end
  end
end
