require 'openssl'

module Ipay
  module Rest
    class Resource
      attr_reader :client

      def initialize(client)
        @client = client
      end

      def post(url, body:, headers: {})
        body[:hash] = create_hash(body.values.join(""))
        handle_response client.connection.post(url, body, default_headers.merge(headers))
      end

      private

      def default_headers
        {}
      end

      def handle_response(response)
        status = response.body['status'] || response.body['header_status']
        message = response.body['text'] || response.body['error']

        case status
        when 0
          raise IpayError, message
        when 2
          raise IpayError, message
        when 400..599
          raise IpayError, message
        when "fe2707etr5s4wq"
          raise FailedTransactionError
        when "bdi6p2yy76etrs"
          raise PendingTransactionError
        when "cr5i3pgy9867e1"
          raise UsedCodeError
        when "dtfi4p7yty45wq"
          raise PaymentDeficitError
        when "eq3i7p5yt7645e"
          raise OverPaymentError
        end

        response
      end

      def create_hash(data_string)
        OpenSSL::HMAC.hexdigest('sha256', Ipay::Rest::SECRET_KEY, data_string)
      end
    end
  end
end