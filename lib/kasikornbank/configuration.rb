class Configuration
  attr_accessor :merchant2
  attr_accessor :term2
  attr_accessor :kbank_secret
  attr_accessor :url2
  attr_accessor :respurl

  def initialize
    # Those are testing details
    # provided by KBanks documentation
    # for testing purpose only
    @merchant2 = '401001234567001'
    @term2 = '70123456'
    @kbank_secret = 'Rtn6DPfR7XCPpc_v8Fx0Fcv40m0XtcVR'
    @url2 = 'https://www.example.com'
    @respurl = 'https://www.example.com'
  end
end
