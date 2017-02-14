module NodeLicenseList
  class ConsoleHelp

    def self.run(opts = {})
      puts 'usage: license_list [--verbose][--help][--export output=file]'
      puts ''
      puts ''
      puts 'Console output'
      puts '  Red licenses indicate copyleft'.red
      puts '  Yellow licenses are unkown to this gem'.yellow
      puts '  Blue licenses indicate that the gem parsed the license file and guessed it is free to use'.blue
      puts '  Green licenses indicate free to use'.green
    end
  end
end
