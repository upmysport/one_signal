module Onesignal
  # The NotificationCreationResult class contains the result of executing the Notify command
  # @since 0.0.1
  class NotificationCreationResult
    # @return [String] Notification identifier
    attr_reader :id
    alias notification_id id
    # @return [Integer] Number of devices to which the notification has been sent
    attr_reader :recipients
    # @return [Array, Hash] List of errors
    attr_reader :errors

    def initialize(attributes = {})
      @id = attributes.fetch(:id, '')
      @recipients = attributes.fetch(:recipients, 0)
      @errors = attributes.fetch(:errors, [])
    end

    # @return [Boolean]
    def success?
      errors.empty?
    end

    def self.from_gateway_response(response)
      NotificationCreationResult.new(response)
    end
  end
end
