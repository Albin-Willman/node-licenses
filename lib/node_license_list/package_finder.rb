module NodeLicenseList
  class PackageFinder
    def self.run
      Dir.glob("node_modules/**")
    end
  end
end
