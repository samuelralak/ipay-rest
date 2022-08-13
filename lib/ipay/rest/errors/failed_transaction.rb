module Ipay
  module Rest
    class FailedTransactionError < IpayError
      def to_s
        'Failed transaction. Not all parameters fulfilled. A notification of this transaction sent to the merchant.'
      end
    end
  end
end