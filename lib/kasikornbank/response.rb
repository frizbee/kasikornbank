module Kasikornbank
	class Response
		attr_accessor :params

		def initialize(params)
			@params = params
		end

		def resp
			binding.pry
		end
	end
end