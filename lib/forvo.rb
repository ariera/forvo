require 'rubygems'
require 'crack'
require 'net/http'

class Forvo
  API_KEY = "232191607a5ec110a7b0359700c1f4b6"
  attr_accessor :word, :uri, :result
  def initialize(word)
    @word = word
    @uri = create_uri(@word)
    @result = get_result
  end

  def get_result
    begin
      http = Net::HTTP.new(@uri.host, @uri.port)
      json = http.get(@uri.path)
      # puts json.inspect
      result = Crack::JSON.parse(json.body)
    rescue
      result = {'errorMessage' => 'JSON Parse Error(Forvo messed up)', 'errorCode' => 69, 'statusCode' => 'ERROR'}
    end
    unless result['statusCode'] == 'ERROR'
      return result
    else
      raise "error"
    end
  end

  def create_uri(word)
    api_url = "http://apifree.forvo.com"
    options = ["action/word-pronunciations", "format/json", "order/rate-desc", "limit/1", "key/#{API_KEY}", "word/#{word}"]
    #    options << "language/#{language_code}" if language_code
    URI.join(api_url, options.join("/"))
  end

  def mp3_url
    @result['items'].first['pathmp3']
  end

  def ogg_url
    @result['items'].first['pathogg']
  end


end

