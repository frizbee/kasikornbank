require "kasikornbank/version"
require 'pry'
require 'digest/md5'
require "kasikornbank/configuration"


module Kasikornbank
	@@fillspace = "Y"

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Render
  	attr_accessor :args
	  # def self.new(*args)
	  # 	@args = args
	  # 	binding.pry
	  # end
	  def initialize(*args)
	  	@args = args
	  	# binding.pry
	  end

	  def pay
	  	binding.pry
	  end

	  def checksum
	  	# Accoording to the documentation we have to create
	  	# MD5 checksum. Should be in this order:
	  	# MERCHANT2 + TERM2 + AMOUNT2 + URL2 + RESURL + IPCUST2 + DETAIL2 + INVMERCHANT + FILLSPACE + SHOPID + PAYTERM2 + MD5 Key
	  	# Optional fields can be skipped (Fillspace, ShopId, payterm2)
			Digest::MD5.hexdigest(
					Kasikornbank.configuration.merchant2 +
					Kasikornbank.configuration.term2 +
					amount_in_cents +
					Kasikornbank.configuration.url2 +
					Kasikornbank.configuration.respurl +
					remote_ip +
					order_details +
					invoice_number +
					@@fillspace +
					Kasikornbank.configuration.kbank_secret
				)
		end

		# Invoice numebr
		# should be Numeric
		# should be 12 digits long
		def invoice_number
			sprintf("%012d",@args[0][:invmerchant])
		end

		# Field DETAIL2
		# Order detail name
		# e.g. Electric Fan - Toshiba Model CM203
		def order_details
			@args[0][:details2]
		end

	  # Get the client's IP address
	  def remote_ip
	  	# This can be used with api.ipify.org service
	  	# public_ip = `curl https://api.ipify.org`
	  	# Extra call not worth it
	  	@args[0][:ip_address]
	  end

	  # Amount should be converted
	  # to be in cents before send to KBank
	  # 10.99 * 100 = 1099
	  def amount_in_cents
	  	# binding.pry
	  	(@args[0][:amount].to_f * 100).to_i
	  end

  end

end
