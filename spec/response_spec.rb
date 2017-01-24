require "spec_helper"

describe Kasikornbank::Response do

  context "Kasikornbank Response on click go back button" do
    let(:response1) {
      Kasikornbank::Response.new(
        {HOSTRESP: "00", RESERVED1: "XXXXXXXXXXXX", AUTHCODE: "000002", RETURNINV: "000000012111", RESERVED2: "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX", CARDNUMBER: "4072XXXXXXXX4249", AMOUNT: "000000004155", THBAMOUNT: "000000000100", CURISO: "036", FXRATE: "000000283155", FILLSPACE: "VISACARDXXXXXXXXXXXX"}
      )
    }

    it "response1 should not be nil" do
      expect(response1).not_to be nil
    end
    it "has success response code" do
      expect(response1.params[:HOSTRESP]).to eq("00")
    end
    it "has to be success" do
      expect(response1.kbank_response[:response]).to eq("success")
    end
    it "has to be correct invoice number" do
      expect(response1.kbank_response[:invoice]).to eq("12111")
    end
    it "has to be correct amount" do
      expect(response1.kbank_response[:amount]).to eq(41.55)
    end
    it "has to has authcode" do
      expect(response1.kbank_response[:auth_code]).to eq("000002")
    end
  end

  context "Kasikornbank Response with SSL callback" do
    let(:response2) {
      Kasikornbank::Response.new(
        {PMGWRESP2: "01104921010005900017340000100764000000121362310120081602424973XXXXXXXX3855XXXXXXXXXXX00000008740000000002001XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXTest PaymentXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX10.198.205.168XXXXRKasikornbank Public Company LimitedXXXXXXXXXXXXXXXXXXXXXXXXXSociete GeneraleXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXTHAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXFRAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX000630303030303030303030303030303030303030300000000000000000000000000000000000000000"}
      )
    }

    it "has response2 and shouldn't be nil" do
      expect(response2).not_to be nil
    end
    it "has correct mertchan id" do
      expect(response2.params[:PMGWRESP2][4...19]).to eq("492101000590001")
    end
    it "has to be success" do
      expect(response2.kbank_response[:response]).to eq("success")
    end
    it "has to be correct invocie number" do
      expect(response2.kbank_response[:invoice]).to eq("121362")
    end
    it "has to be correct amount" do
      expect(response2.kbank_response[:amount]).to eq(874.0)
    end
    it "should has auth code nil" do
      expect(response2.kbank_response[:auth_code]).to be nil
    end
  end

  context "Kasikornbank Response without SSL standart callback" do
    let(:response3) {
      Kasikornbank::Response.new(
        {PMGWRESP: "00XXXXXXXXXXXX000002XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX00000000011431012008143451000000008882XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXVISACARDXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX000000251400036000000283033"}
      )
    }

    it "has response3 and shouldn't be nil" do
      expect(response3).not_to be nil
    end
    it "has success standart response" do
      expect(response3.params[:PMGWRESP][0...2]).to eq("00")
    end
    it "has AUD (036) currency in standart response" do
      expect(response3.params[:PMGWRESP][206...209]).to eq("036")
    end
    it "has to be success" do
      expect(response3.kbank_response[:response]).to eq("success")
    end
    it "has to be correct invoice number" do
      expect(response3.kbank_response[:invoice]).to eq("114")
    end
    it "has to be correct amount" do
      expect(response3.kbank_response[:amount]).to eq(88.82)
    end
    it "has auth code" do
      expect(response3.kbank_response[:auth_code]).to eq('000002')
    end
  end
end
