module Kasikornbank
  class Response
    attr_accessor :params

    def initialize(params)
      @params = params
    end

    def kbank_response
      response = Hash.new
      if @params[:PMGWRESP2]
        str = @params[:PMGWRESP2]
        response[:response] = response_code(str[97...99])
        response[:invoice] = remove_lead_zero(str[32...44])
        response[:amount] = amount(str[85...97])
        response[:auth_code] = nil
      elsif @params[:HOSTRESP]
        response[:response] = response_code(@params[:HOSTRESP])
        response[:invoice] = remove_lead_zero(@params[:RETURNINV])
        response[:amount] = amount(@params[:AMOUNT])
        response[:auth_code] = @params[:AUTHCODE]
      elsif @params[:PMGWRESP]
        str = @params[:PMGWRESP]
        response[:response] = response_code(str[0...2])
        response[:invoice] = remove_lead_zero(str[56...68])
        response[:amount] = amount(str[82...94])
        response[:auth_code] = str[14...20]
      end
      response
    end

    private

      # Converting amount and
      # returning in decimal
      def amount(value)
        value = remove_lead_zero(value)
        value.to_f / 100
      end

      # Removing all leading zeros
      def remove_lead_zero(value)
        value.sub!(/^[0]+/,'')
      end

      def response_code(value)
        case value
        when "00"
          "success"
        else
          "fail"
        end
      end
  end
end
