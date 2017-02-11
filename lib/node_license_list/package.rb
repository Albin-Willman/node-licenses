module NodeLicenseList
  class Package
    attr_accessor :name, :license
    def initialize(name, license)
      @name, @license = name, license
    end
  end
end
