module Onesignal
  # The DeviceCreationResult class contains the result of executing the AddDevice command
  # @since 0.0.1
  class DeviceCreationResult
    # @return [String] Onesignal device identifier
    attr_reader :id
    alias device_id id
    # @return [Array] List of errors
    attr_reader :errors

    def initialize(attributes = {})
      @id = attributes.fetch(:id, '')
      @errors = attributes.fetch(:errors, [])
    end

    # @return [Boolean]
    def success?
      errors.empty?
    end

    def self.from_gateway_response(response)
      DeviceCreationResult.new(response)
    end
  end
end
