module NodeLicenseList

  class Main
    def self.run(verbose = false)
      node_modules = PackageFinder.run
      raise 'No node modules' if node_modules.length == 0
      node_modules = node_modules.map { |p| PackageParser.run(p) }
      groups = PackageGrouper.run(node_modules)
      OutputFormater.run(groups, verbose)

      node_modules
    end
  end
end
