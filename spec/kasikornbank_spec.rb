require "spec_helper"
require "kasikornbank"
require "kasikornbank/configuration"

describe Kasikornbank do
	let(:bank) { Kasikornbank::Render.new(
		{payment: "credit card",
			back_url: "https://example.com/back",
			amount: 10.99,
			ip_address: "127.0.0.1",
			details2: "Booking villa",
			invmerchant: 987,
			shop_id: "Electric Fan",
			payterm2: "10"
		}
	)}

  it "has a version number" do
    expect(Kasikornbank::VERSION).not_to be nil
  end

  it "has args to start" do
  	expect(bank).to_not be(nil)
  end

  it "has correct amount" do
  	expect(bank.args[0][:amount]).to eql(10.99)
  end

  it "has amount in cents to be correct" do
  	expect(bank.amount_in_cents).to eq("000000001099")
  end

  it "has correct ip address" do
  	expect(bank.remote_ip).to eql("127.0.0.1")
  end

  it "has some payment details" do
  	expect(bank.order_details).to_not be nil
  end

  it "not nil for invoice" do
  	expect(bank.invoice_number).to_not be nil
  end

  it "has correct invoice numebr" do
  	expect(bank.invoice_number).to eq("000000000987")
  end

  it "should return MD5 checksum and shouldn't be nil" do
  	configure = Configuration.new
  	# All the configurations are already in the settions
  	# configure.term2 = "70123456"
  	# configure.merchant2 = "401001234567001"
  	# configure.kbank_secret = "Rtn6DPfR7XCPpc_v8Fx0Fcv40m0XtcVR"
  	# configure.url2 = "https://www.example.com"
  	# configure.respurl = "https://www.example.com"
  	Kasikornbank.configure { configure }
  	expect(bank.checksum).to_not be nil 
  	# binding.pry
  	expect(bank.checksum).to eq("a3394c6950b0d8b64533ef5f1c0dc4cf")
  end

  it "should return something when call form method" do
  	expect(bank.form).to_not be nil
  end

  it "shoud return shop id if provided" do
  	expect(bank.shop_id).to_not be nil
  end

end
