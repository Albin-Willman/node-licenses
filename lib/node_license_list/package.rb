module NodeLicenseList
  class Package
    attr_accessor :name, :license, :path
    def initialize(name, license, path)
      @name, @license, @path = name, license, path
    end
  end
end
