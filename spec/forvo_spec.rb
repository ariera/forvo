require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

#describe "ForvoUrl" do
#  it "generates a complete url" do
#    API_KEY= "testing"
#    ForvoUrl.new("palabra").to_s.should == "http://apifree.forvo.com/action/word-pronunciations/order/rate-desc/limit/1/key/testing/word/palabra"
#  end
#end

describe "Forvo" do
  it "sends a request successfully" do
    Forvo.new("scarcely").mp3_url.should be
  end
end

