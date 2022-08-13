module Ipay
  module Rest
    class PaymentDeficitError < IpayError
      def to_s
        'Less: The amount that you have sent via mobile money is LESS than what was required to validate this transaction.'
      end
    end
  end
end