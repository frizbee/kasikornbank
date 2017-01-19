class Configuration
  attr_accessor :merchant2
	attr_accessor :term2
	attr_accessor :kbank_secret
	attr_accessor :url2
	attr_accessor :respurl

  def initialize
    @merchant2 = 'default_option'
    @term2 = 'default_option'
    @kbank_secret = 'default_option'
    @url2 = 'default_option'
    @respurl = 'default_option'
  end
end