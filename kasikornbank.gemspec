# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kasikornbank/version'

Gem::Specification.new do |spec|
  spec.name          = "kasikornbank"
  spec.version       = Kasikornbank::VERSION
  spec.authors       = ["Andre Antonov"]
  spec.email         = ["mail2andrewa@gmail.com"]

  spec.summary       = %q{This gem provides support for the accepting a credit cards payments with K-Payment Gatewak (Kasikorn bank)}
  spec.description   = %q{K-Payment Gateway is a payment service for processing credit card transactions that accept VISA Cards, MasterCard Cards, American Express, JCB Cards and China UnionPay Cards issued by banks worldwide. Participating online merchants can receive real time approval of credit card online transactions 24 hours a day in 35 different currencies.}
  spec.homepage      = "https://github.com/frizbee/kasikornbank"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'pry', '~> 0.10.4'
end
