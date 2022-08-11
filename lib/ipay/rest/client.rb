require "faraday"

module Ipay
  module Rest
    class Client
      BASE_URL="https://apis.ipayafrica.com/payments/v2/"
      attr_reader :vid, :key, :adapter

      def initialize(vid:, key:, adapter: Faraday.default_adapter)
        @vid = vid
        @keu = key
        @adapter = adapter
      end

      def connection
        @connection ||= Faraday.new do |conn|
          conn.url_prefix = BASE_URL
          conn.request :url_encoded
          conn.response :json, content_type: "application/json"
          conn.adapter @adaptor
        end
      end

      def inspect
        "#<Ipay::Rest::Client>"
      end
    end
  end
end