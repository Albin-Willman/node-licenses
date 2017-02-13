module NodeLicenseList

  class Export
    def self.run(opts = {})
      raise 'No export path' unless opts[:output]
      node_modules = PackageFinder.run
      raise 'No node modules' if node_modules.length == 0
      node_modules = node_modules.map { |p| PackageParser.run(p) }
      groups = PackageGrouper.run(node_modules)
      FileWriter.run(groups, opts[:output])

      node_modules
    end
  end
end
