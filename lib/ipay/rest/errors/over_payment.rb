module Ipay
  module Rest
    class OverPaymentError < IpayError
      def to_s
        'More: The amount that you have sent via mobile money is MORE than what was required to validate this transaction.'
      end
    end
  end
end