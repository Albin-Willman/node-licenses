require 'json'

module NodeLicenseList
  class PackageParser
    def self.run(path = '')
      parse_package_json(path)
    end

    private
    def self.parse_package_json(path)
      json_path = "#{path}/package.json"
      return unless File.file?(json_path)
      json = JSON.parse(File.read(json_path))
      Package.new(json['name'], license(json['license'], path).downcase, path)
    end

    def self.license(info, path)
      return parse_license_file(path) unless info
      return info if info.is_a?(String)
      return info.join(', ') if info.is_a?(Array)
      info['type']
    end

    def self.parse_license_file(path)
      LicenseFileParser.parse(path)
      'unknown' # TODO: parse license file for info if no other option is open
    end
  end
end
