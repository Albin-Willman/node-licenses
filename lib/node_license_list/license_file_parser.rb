module NodeLicenseList
  class LicenseFileParser
    def self.parse(path)
      line = parse_license_file(path)
      return 'no license found' unless line
      interpret(line)
    end

    private
    def self.interpret(line)
      return 'probably copyright' if line.start_with?('copyright')
      return 'probably mit' if line.include?('mit')
      line
    end

    def self.parse_license_file(path)
      Dir.chdir(path) do
        Dir.glob("*").each do |file|
          return find_first_line(file) if file.upcase.start_with?('LICEN')
        end
      end
      nil
    end

    def self.find_first_line(file)
      File.open(file).read.each_line do |line|
        line = line.gsub(/\s+/, '')
        return line.downcase if line.length > 0 && !line.start_with?('#')
      end
    end
  end
end
