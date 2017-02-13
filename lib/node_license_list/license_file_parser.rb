module NodeLicenseList
  POSSIBLE_FILE_ENDINGS = [
    '',
    '.txt',
    '.md'
  ]
  class LicenseFileParser
    def self.parse(path)
      file = find_license_file(path)
      return 'unknown' unless file
      do_parse(file)
    end

    private
    def self.do_parse(file)
      'parsed'
    end

    def self.find_license_file(path)
      POSSIBLE_FILE_ENDINGS.each do |ending|
        license_path = "#{path}/LICENSE#{ending}"
        return File.read(license_path) if File.file?(license_path)
      end
      nil
  end
end
