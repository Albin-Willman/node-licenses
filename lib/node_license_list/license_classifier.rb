module NodeLicenseList
  class LicenseClassifier
    SAFE_LICENSES = [
      'mit',
      'isc'
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
      return :open if SAFE_LICENSES.include?(license)
      :unknown
    end
  end
end
