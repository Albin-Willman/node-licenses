module NodeLicenseList
  class OutputFormater
    def self.run(all_packages, verbose = false)
      all_packages.each do |license, packages|
        verbose ? print_full(license, packages) : print(license, packages)
      end
    end

    private

    def self.print_full(license, packages)
      puts "=== #{license} ==="
      packages.each { puts license }
    end

    def self.print(license, packages)
      puts "=== #{license} === #{packages.length}"
    end
  end
end
