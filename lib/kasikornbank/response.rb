module Kasikornbank
  class Response
    attr_accessor :params
    CARD_TYPES = {001 => "VISA", 002 => "MasterCard", 003 => "KBank", 004 => "JCB", 005 => "CUP", 007 => "AMEX"}.freeze

    def initialize(params)
      @params = params
    end

    def kbank_response
      response = Hash.new
      if @params[:PMGWRESP2]
        str = @params[:PMGWRESP2]
        response[:respcode] = str[97...99]
        response[:response] = response_code(str[97...99])
        response[:invoice] = remove_lead_zero(str[32...44])
        response[:amount] = amount(str[85...97])
        response[:auth_code] = 'N/A'
        response[:card] = str[58...77]
        response[:card_type] = card_type(str[105...108])
      elsif @params[:HOSTRESP]
        response[:respcode] = @params[:HOSTRESP]
        response[:response] = response_code(@params[:HOSTRESP])
        response[:invoice] = remove_lead_zero(@params[:RETURNINV])
        response[:amount] = amount(@params[:AMOUNT])
        response[:auth_code] = @params[:AUTHCODE]
        response[:card] = 'N/A'
        response[:card_type] = 'N/A'
      elsif @params[:PMGWRESP]
        str = @params[:PMGWRESP]
        response[:respcode] = str[0...2]
        response[:response] = response_code(str[0...2])
        response[:invoice] = remove_lead_zero(str[56...68])
        response[:amount] = amount(str[82...94])
        response[:auth_code] = str[14...20]
        response[:card] = 'N/A'
        response[:card_type] = 'N/A'
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

      def card_type(value)
        if value
          CARD_TYPES[value.to_i]
        else
          "N/A"
        end
      end
  end
end
