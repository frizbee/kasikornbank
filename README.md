[![Build Status](https://travis-ci.org/frizbee/kasikornbank.svg?branch=master)](https://travis-ci.org/frizbee/kasikornbank)

# Kasikornbank Payment Gateway

This gem provides support for the accepting a credit cards payments with
K-Payment Gateway (Kasikorn Bank Payment Gateway)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kasikornbank', :git => 'git://github.com:frizbee/kasikornbank.git'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kasikornbank

## Usage

Generate initializer

```
rails g kasikornbank:install
```
Set credentials and other options in `config/initializers/kasikornbank.rb`
```
Kasikornbank.configure do |config|
  config.merchant2 = ENV["KBANK_MERCHANT2"]
  config.term2 = ENV["KBANK_TERM2"]
  config.kbank_secret = ENV["KBANK_SECRET"]
  config.url2 = "https://www.example.com/kbank_back_url"
  config.respurl = "https://www.example.com/kbank_notify_url"
end
```

`config.merchant2` = Merchant ID Your merchant number issued by KBank. Numeric 15 digits e.g. 401001234567001.   
`config.term2` = Terminal ID Your terminal ID issued by KBank. Numeric 8 digits e.g. 70123456.   
`config.kbank_secret` = Secret key (salt) to make md5 hash. Issued by KBank.   
`config.url2` = URL where cardholder will be redirected back to merchant website.  
`config.respurl` = Notify url. Must be SSL/TLS URL where KBank will send a variable PMGWRESP2. 

In your create method call 
```
kbank = Kasikornbank::Render.new({
	invmerchant: "987",
	details2: "Electric Fan = Model XYZ103", 
	ip_address: "111.111.111.205",
	amount: 10.99
})
```

`invmerchant` = Invoice number, should be a unique number.  
`details2` = Product description.  
`ip_address` = IP address of merchant's server.  
`amount` = Total amount of purchased order.  

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/frizbee/kasikornbank. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

