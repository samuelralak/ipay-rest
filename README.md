# Ipay::Rest

A Ruby API Wrapper for the iPay Rest API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ipay-rest'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install ipay-rest

## Setup

Ensure that the following environment variables are set

```shell
LIVE=0 # set to 1 for production environment
VID=demo
IPAY_SECRET_KEY=demoCHANGED
IPAY_BASE_URL=https://apis.ipayafrica.com/payments/v2/
IPAY_CURRENCY=KES # defaults to kes
```

## Usage

```ruby
#
# initialize new client
# 
>>  client = Ipay::Rest::Client.new
=> #<Ipay::Rest::Client>

#
#  initiate an iPay transaction
# 
>>  client.transaction.initiate(oid: "rand13", inv: "rand13", amount: 10, tel: "0706311322", eml: "test@mail.com", cbk: "https://webhook.site/d31d7a1f-b54b-4d0a-85bd-ad7fbcf70329")
=> #<Ipay::Rest::Initiator:0x0000000127ad4f80 @attributes=#<OpenStruct header_status=200, status=1, data={"sid"=>"RANDEM315E0166024821954305324DEMO", "oid"=>"rand13", "amount"=>"10", "account"=>"AT2222230339Z", "payment_channels"=>[{"name"=>"MPESA", "paybill"=>"261144"}, {"name"=>"AIRTEL", "paybill"=>"510800"}, {"name"=>"EQUITEL", "paybill"=>"510800"}], "hash"=>"f6ee6f800c0b0029d4e35617a1cd7f7eef1b1ffe82d55d72a209aa38ea2da304"}>>

#
#  trigger stk push (mpesa) or ussd push (airtel)
#
>> client.transaction.push(channel: "mpesa", phone: "0706311322", sid: "RANDEM315E0166025040998533804DEMO")
=> #<Ipay::Rest::UssdPush:0x000000014d885f60 @attributes=#<OpenStruct header_status=200, status=1, text="A Payment request has been sent to the MPESA number 0706311322">>

#
#  check status of a transaction
#
>> client.transaction.status(sid: "RANDEM315E0166025040998533804DEMO")
=> #<Ipay::Rest::TransactionStatus:0x000000014d9d2ad0 @attributes=#<OpenStruct status="aei7p7yrx4ae34", txncd="QHB72TPZBP", msisdn_id="SAMUEL OYENGO", msisdn_idnum="254706311322", p1="1", p2="2", p3="3", p4="4", uyt=1523817820, agt=912100205, qwh=40888604, ifd=1216531831, afd=1897686359, poi=1978274833, id="rand14", ivm="rand14", mc="10.00", channel="MPESA">>

#
#  query transaction by the order id
#
>> client.transaction.search(oid: "rand14")
=> #<Ipay::Rest::TransactionStatus:0x000000014b5739f0 @attributes=#<OpenStruct header_status=200, status=1, text="payment record found", data={"vid"=>"demo", "oid"=>"rand14", "transaction_amount"=>"10.00", "transaction_code"=>"QHB72TPZBP", "telephone"=>"254706311322", "firstname"=>"SAMUEL", "lastname"=>"OYENGO", "paid_at"=>"2022-08-11 23:41:49", "payment_mode"=>"MPESA", "sid"=>"RANDEM315E0166025040998533804DEMO"}, hash="847876734b40ff598366b5f7b089eb481a100d223e41b8f14df6fdcabcbe2325">>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/samuelralak/ipay-rest. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/samuelralak/ipay-rest/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Ipay::Rest project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/samuelralak/ipay-rest/blob/master/CODE_OF_CONDUCT.md).
