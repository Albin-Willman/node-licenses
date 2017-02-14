require 'csv'
module NodeLicenseList
  class FileWriter
    def self.run(package_groups, path)
      CSV.open(path, "w", { col_sep: ';' }) do |csv|
        csv << ['Package', 'License', 'Type']
        package_groups.each do |license, packages|
          level = LicenseClassifier.safety_level(license)
          packages.each do |p|
            csv << [p, license, level.to_s]
          end
        end
      end
    end
  end
end
