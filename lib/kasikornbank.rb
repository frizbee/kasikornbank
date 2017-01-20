require "kasikornbank/version"
require 'pry'
require 'digest/md5'
require "kasikornbank/configuration"

module Kasikornbank
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Render
  	@@fillspace = "Y"
  	@@kbank_url = "https://rt05.kasikornbank.com/pggroup/payment.aspx"
  	attr_accessor :args
	  
	  def initialize(*args)
	  	@args = args
	  end
		
		# For testing purpose, will be removed
	  def string
	  	"#{Kasikornbank.configuration.merchant2}#{Kasikornbank.configuration.term2}#{amount_in_cents}#{Kasikornbank.configuration.url2}#{Kasikornbank.configuration.respurl}#{remote_ip}#{order_details}#{invoice_number}#{@@fillspace}#{Kasikornbank.configuration.kbank_secret}"
	  end

	  def form
	  	form = "<form name='sendform' method='post' action='#{@@kbank_url}'>"
	  	form << "<input type='hidden' id=MERCHANT2 name=MERCHANT2 value='#{Kasikornbank.configuration.merchant2}'>"
	  	form << "<input type='hidden' id=TERM2 name=TERM2 value='#{Kasikornbank.configuration.term2}'>"
	  	form << "<input type='hidden' id=AMOUNT2 name=AMOUNT2 value='#{amount_in_cents}'>"
	  	form << "<input type='hidden' id=URL2 name=URL2 value='#{Kasikornbank.configuration.url2}'>"
	  	form << "<input type='hidden' id=RESPURL name=RESPURL value='#{Kasikornbank.configuration.respurl}'>"
	  	form << "<input type='hidden' id=IPCUST2 name=IPCUST2 value='#{remote_ip}'>"
	  	form << "<input type='hidden' id=DETAIL2 name=DETAIL2 value='#{order_details}'>"
	  	form << "<input type='hidden' id=INVMERCHANT name=INVMERCHANT value='#{invoice_number}'>"
	  	form << "<input type='hidden' id=FILLSPACE name=FILLSPACE value='#{@@fillspace}'>"
	  	form << "<input type='text' name='SHOPID' id='SHOPID' value='#{shop_id}'>"
	  	form << "<input type='text' id=Payterm2 name=Payterm2 value='#{payterm2}'>"
	  	form << "<input type='text' id='CHECKSUM' value='#{checksum}'>"
	  	form << "</form>"
	  	form << "<script>"
	  	form << "window.onload = function(){document.forms['sendform'].submit()}"
			form << "</script>"
	  	form
	  end

	  def checksum
	  	# Accoording to the documentation we have to create
	  	# MD5 checksum. Should be in this order:
	  	# MERCHANT2 + TERM2 + AMOUNT2 + URL2 + RESURL + IPCUST2 + DETAIL2 + INVMERCHANT + FILLSPACE + SHOPID + PAYTERM2 + MD5 Key
	  	# Optional fields can be skipped (Fillspace, ShopId, payterm2)
			Digest::MD5.hexdigest(
					"#{Kasikornbank.configuration.merchant2}#{Kasikornbank.configuration.term2}#{amount_in_cents}#{Kasikornbank.configuration.url2}#{Kasikornbank.configuration.respurl}#{remote_ip}#{order_details}#{invoice_number}#{@@fillspace}#{shop_id}#{payterm2}#{Kasikornbank.configuration.kbank_secret}"
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

		# Optional
		# Shop ID. for payment template
		def shop_id
			@args[0][:shop_id]
		end

		# Optional
		# Number of month for installment
		# 2 digits = 3,6,10 month
		def payterm2
			@args[0][:payterm2]
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
	  # Should be 12 digits number
	  def amount_in_cents
	  	amount = (@args[0][:amount].to_f * 100).to_i
	  	sprintf("%012d",amount)
	  end

  end

end
