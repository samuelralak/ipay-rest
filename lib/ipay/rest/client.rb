require "faraday"

module Ipay
  module Rest
    class Client
      attr_reader :adapter

      def initialize(adapter: Faraday.default_adapter)
        @adapter = adapter
      end

      def connection
        @connection ||= Faraday.new do |conn|
          conn.url_prefix = Ipay::Rest::BASE_URL
          conn.request :url_encoded
          conn.response :json, content_type: "application/json"
          conn.adapter @adaptor
        end
      end

      def transaction
        TransactionResource.new(self )
      end

      def inspect
        "#<Ipay::Rest::Client>"
      end
    end
  end
end