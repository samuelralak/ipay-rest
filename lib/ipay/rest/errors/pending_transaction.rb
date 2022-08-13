module Ipay
  module Rest
    class PendingTransactionError < IpayError
      def to_s
        'Pending: Incoming Mobile Money Transaction Not found. Please try again in 5 minutes.'
      end
    end
  end
end