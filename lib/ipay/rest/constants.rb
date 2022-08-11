module Ipay
  module Rest
    LIVE = ENV.fetch("LIVE") { 0 }
    VID = ENV.fetch("VID") { "demo" }
    SECRET_KEY = ENV.fetch("IPAY_SECRET_KEY") { "demoCHANGED" }
    BASE_URL=ENV.fetch("IPAY_BASE_URL") { "https://apis.ipayafrica.com/payments/v2/" }
    DEFAULT_CURRENCY=ENV.fetch("IPAY_CURRENCY") { "KES" }
  end
end
