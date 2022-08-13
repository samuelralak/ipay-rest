module Ipay
  module Rest
    class UsedCodeError < IpayError
      def to_s
        'Used: This code has been used already. A notification of this transaction sent to the merchant.'
      end
    end
  end
end