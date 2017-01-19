require "spec_helper"

describe Kasikornbank do
	let(:bank) { Kasikornbank::Render.new(
		{payment: "credit card",
			back_url: "https://example.com/back",
			amount: 10.99,
			ip_address: "127.0.0.1",
			details2: "Booking villa",
			invmerchant: 987
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
  	payment = bank
  	expect(payment.amount_in_cents).to eq(1099)
  end

  it "has correct ip address" do
  	payment = bank
  	expect(payment.remote_ip).to eql("127.0.0.1")
  end

  it "has some payment details" do
  	payment = bank
  	expect(payment.order_details).to_not be nil
  end

  it "not nil for invoice" do
  	payment = bank
  	expect(payment.invoice_number).to_not be nil
  end

  it "has correct invoice numebr" do
  	payment = bank
  	expect(payment.invoice_number).to eq("000000000987")
  end

  it "should return somethig for checksum functions" do
  	payment = bank
  	expect(payment.checksum).to_not be nil
  end
end
