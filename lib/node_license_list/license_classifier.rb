module NodeLicenseList
  class LicenseClassifier
    OPEN_LICENSES = [
      'mit',
      'isc',
      'apache-2.0',
      'mit license',
      'bsd',
      'public domain'
    ]
    COPYLEFT_LICENSES = [
      'mechanical',
      'gnu',
      'oclc',
      'realnetworks',
      'reciprocal',
      'peer',
      'odc',
      'open software'
    ]

    def self.safety_level(license)
      COPYLEFT_LICENSES.each do |type|
        return :copyleft if license.include?(type)
      end
      return :open if OPEN_LICENSES.include?(license)
      :unknown
    end
  end
end
