require "kasikornbank/version"
require 'pry'
require 'digest/md5'
# require "kasikornbank/configuration"


module Kasikornbank

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

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

end
