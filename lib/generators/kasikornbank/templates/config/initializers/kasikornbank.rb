# Cardholder/customer checks out from the merchant website and merchant website redirects
# cardholder to K-Payment Gateway with pre-agreed parameters. The following parameters need to
# be passed to K-Payment Gateway to process the transaction with Method = POST.

# Use this hook to configure KBank variables
Kasikornbank.configure do |config|

	# Merchant ID Your merchant number issued by KBank
	# Numeric 15 digits e.g. 401001234567001
	config.merchant2 = ENV["KBANK_MERCHANT2"]

	# Terminal ID Your terminal ID issued by KBank
	# Numeric 8 digits e.g. 70123456
	config.term2 = ENV["KBANK_TERM2"]

	# Secret key (salt) to make md5 hash
	# Issued by KBank Merchant must keep „MD5 Secret Key‟
	# as secret between merchant and Kbank.
	# Please strictly do not reveal this key to any other
	# persons who are not concerned.
	# MD5 Key issued by Kasikorn Bank
	config.kbank_secret = ENV["KBANK_SECRET"]

	# URL where cardholder will be redirected
	# back to merchant website
	config.url2 = "https://www.example.com"

	# Must be SSL/TLS URL where KBank will send a variable PMGWRESP2
	config.respurl = "https://www.example.com"
end