module NodeLicenseList
  class OutputFormater
    def self.run(all_packages, verbose = false)
      all_packages.each do |license, packages|
        verbose ? print_full(license, packages) : print(license, packages)
      end
    end

    private

    def self.print_full(license, packages)
      puts colorize("=== #{license} ===", license)
      packages.each { |name| puts colorize(name, license) }
    end

    def self.print(license, packages)
      puts colorize("=== #{license} === #{packages.length}", license)
    end

    def self.colorize(string, license)
      string.send(color_for(license))
    end

    def self.color_for(license)
      case LicenseClassifier.safety_level(license)
      when :copyleft then return :red
      when :open then return :green
      else
        return :yellow
      end
    end
  end
end
