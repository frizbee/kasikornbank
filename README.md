[![Build Status](https://travis-ci.org/frizbee/kasikornbank.svg?branch=master)](https://travis-ci.org/frizbee/kasikornbank)
[![Gem Version](https://badge.fury.io/rb/kasikornbank.svg)](https://badge.fury.io/rb/kasikornbank)
[![Code Climate](https://codeclimate.com/github/frizbee/kasikornbank/badges/gpa.svg)](https://codeclimate.com/github/frizbee/kasikornbank)
[![Issue Count](https://codeclimate.com/github/frizbee/kasikornbank/badges/issue_count.svg)](https://codeclimate.com/github/frizbee/kasikornbank)

# Kasikorn Bank Payment Gateway (Thailand)

This gem provides support for the accepting a credit cards payments with
K-Payment Gateway (Kasikorn Bank Payment Gateway)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kasikornbank', '~> 0.1.5'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kasikornbank

## Usage

### 1 - Configuration

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

### 2 - Render Form

In your `checkout#create` method call
```
kbank = Kasikornbank::Render.new({
	invmerchant: "987",
	details2: "Electric Fan = Model XYZ103",
	ip_address: "111.111.111.205",
	amount: 10.99,
	shop_id: "00",
	payterm2: "10"
})
```

`invmerchant` = Invoice number, should be a unique number.
`details2` = Product description.
`ip_address` = IP address of merchant's server.
`amount` = Total amount of purchased order.
`shop_id` = <**Optional**> Shop ID, for payment template, see documentation.
`payterm2` = <**Optional**> Number of month for installment.

> :exclamation: Unfortunately, Kasikorn Bank doesn't have a proper way to handle payment API. In this case `Kasikornbank::Render.new()` will generage auto submit form and return it with `post` method. This form should be placed in `checkout#create` view file.

#### Example

_\# app/controllers/checkout_controller.rb_
```
require 'kasikornbank'

....

def create
	kbank = Kasikornbank::Render.new({
		invmerchant: "987",
		details2: "Electric Fan = Model XYZ103",
		ip_address: "111.111.111.205",
		amount: 10.99
	})
	@form = kbank.form
end
```
_\# app/views/checkout/create.html.erb_
```
<%= @form.html_safe if @form.present? %>
```

### 3 - Response

To be able to receive response from KBank you have to create another action in your checkout controller with post request as it is mandatory by KBank.

In your `routes.rb` file add `post 'checkout/kbank_response', to: 'checkout#kbank_response'` make sure that this line is out of scope of your locale.

Next step is to avoid blocking request by CSRF rule. This post request will come directly from KBank server, you need to make sure that `checkout#kbank_response` action is not blocked by CSRF. To do that, go to `checkout_controller.rb` and add this line:  `skip_before_action :verify_authenticity_token, :only => [:kbank_response]` this will give access to post anything to your action. Scary huh?

KBank will send response to your `checkout#kbank_response` action to
catch that respose use `Kasikornbank::Response.new(request.POST)` method
in your controller. You will be provided with hash of data `{:response=>"success", :invoice=>"17", :amount=>874.0, :auth_code=>nil}` use it to update your database.

#### Example

_\# config/routes.rb_
```
scope "/:locale", locale: /en|th|zh/ do
  ...
  resources :checkout, only: [:new, :create]
  ...
end
post "checkout/kbank_response", to: "checkout#kbank_response"
```

_\# app/controllers/checkout_controller.rb_
```
require 'kasikornbank'
skip_before_action :verify_authenticity_token, :only => [:kbank_response, :kbank_notification]

...
# This is where cardholder will be re-directed back to merchant's website (POST request)
def kbank_response
  response = Kasikornbank::Response.new(request.POST)
  kbank = response.kbank_response
  checkout = Checkout.find(kbank[:invoice])
  ...
  # Here update your DB
  # and send confirmation emails
  ...
end

# This URI where kbank will send a variable 'PMGWRESP2' to merchant's server (POST requrest)
def kbank_notification
  response = Kasikornbank::Response.new(request.POST)
  kbank = response.kbank_response
  checkout = Checkout.find(kbank[:invoice])
  ...
  # Here update your DB
  # and send confirmation emails
  ...
end
```
_\# Response will be `{:respcode=>"00", :response=>"success", :invoice=>"21", :amount=>211.0, :auth_code=>"140580", :card=>"4751XXXXXXXX1452", :card_type=>"VISA"}`_
> Controller name, routes, response url can be replaced with name you like.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/frizbee/kasikornbank. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

