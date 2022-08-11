module Ipay
  module Rest
    class Error < StandardError; end

    class FailedTransactionError < StandardError
      def to_s
        'Failed transaction. Not all parameters fulfilled. A notification of this transaction sent to the merchant.'
      end
    end

    class PendingTransactionError < StandardError
      def to_s
        'Pending: Incoming Mobile Money Transaction Not found. Please try again in 5 minutes.'
      end
    end

    class UsedCodeError < StandardError
      def to_s
        'Used: This code has been used already. A notification of this transaction sent to the merchant.'
      end
    end

    class PaymentDeficitError < StandardError
      def to_s
        'Less: The amount that you have sent via mobile money is LESS than what was required to validate this transaction.'
      end
    end

    class OverPaymentError < StandardError
      def to_s
        'More: The amount that you have sent via mobile money is MORE than what was required to validate this transaction.'
      end
    end
  end
end