require "ipay/rest/version"

module Ipay
  module Rest
    autoload :Client, "ipay/rest/client"
    autoload :Error, "ipay/rest/error"
    autoload :Object, "ipay/rest/object"

    autoload :Initiator, 'ipay/rest/objects/initiator'
    autoload :Initiator, 'ipay/rest/objects/transaction'
    autoload :Initiator, 'ipay/rest/objects/transaction_status'
    autoload :Initiator, 'ipay/rest/objects/ussd_push'
  end
end
