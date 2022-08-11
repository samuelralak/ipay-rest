module Ipay
  module Rest
    class TransactionResource < Resource
      def initiate(oid:, inv:, amount:, tel:, eml:, cbk:, **params)
        body = initiate_params.merge({oid: oid, inv: inv, amount: amount, tel: tel, eml: eml, cbk: cbk}, params)
        Initiator.new post("transact", body: body).body
      end

      def status(sid:)
        body = status_params.merge({sid: sid})
        TransactionStatus.new post("transact/mobilemoney", body: body).body
      end

      def search(oid:)
        body = search_params.merge({oid: oid})
        TransactionStatus.new post("transaction/search", body: body).body
      end

      def push(channel:, phone:, sid:)
        body = push_params.merge({phone: phone, sid: sid})
        UssdPush.new post("transact/push/#{channel}", body: body).body
      end

      private

      def initiate_params
        Hash[
          live: Ipay::Rest::LIVE,
          oid: nil,
          inv: nil,
          amount: nil,
          tel: nil,
          eml: nil,
          vid: Ipay::Rest::VID,
          curr: Ipay::Rest::DEFAULT_CURRENCY,
          p1: "1",
          p2: "2",
          p3: "3",
          p4: "4",
          cst: 0,
          cbk: nil,
        ]
      end

      def push_params
        Hash[phone: nil, vid: Ipay::Rest::VID, sid: nil]
      end

      def status_params
        Hash[sid: nil, vid: Ipay::Rest::VID]
      end

      def search_params
        Hash[oid: nil, vid: Ipay::Rest::VID]
      end
    end
  end
end