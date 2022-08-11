require "ipay/rest/version"
require "ipay/rest/constants"

module Ipay
  module Rest
    autoload :Client, "ipay/rest/client"
    autoload :Error, "ipay/rest/error"
    autoload :Object, "ipay/rest/object"
    autoload :Resource, "ipay/rest/resource"

    autoload :Initiator, 'ipay/rest/objects/initiator'
    autoload :Transaction, 'ipay/rest/objects/transaction'
    autoload :TransactionStatus, 'ipay/rest/objects/transaction_status'
    autoload :UssdPush, 'ipay/rest/objects/ussd_push'

    autoload :TransactionResource, 'ipay/rest/resources/transaction'
  end
end
