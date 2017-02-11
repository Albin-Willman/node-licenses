require 'json'

module NodeLicenseList
  class PackageParser
    def self.run(path = '')
      data = parse_package_json(path)

      data
    end

    private
    def self.parse_package_json(path)
      puts path
      json_path = "#{path}/package.json"
      puts json_path
      return unless File.file?(json_path)
      json = JSON.parse(File.read(json_path))
      Package.new(json['name'], json['license'])
    end
  end
end
