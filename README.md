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

In your create method call 
```
kbank = Kasikornbank::Render.new({
	invmerchant: "987", # invoice number, should be a unique number
	details2: "Electric Fan = Model XYZ103", # Product description
	ip_address: "111.111.111.205", # IP address of merchant's server
	amount: 10.99 # Total amount of purchased order
})
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/frizbee/kasikornbank. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

