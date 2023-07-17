# frozen_string_literal: true

require_relative "promptjoy-ruby/version"
require 'net/http'
require 'json'
require 'uri'
require 'logger'

module PromptjoyRuby
  class Error < StandardError; end

  class Client
    def initialize(api_key = nil, logger: Logger.new(STDOUT))
      @api_key = api_key
      @logger = logger
    end

    def find_by_api_url(url, api_key: nil)
      Api.new(api_key || @api_key, url, logger: @logger)
    end
  end

  class Api
    USER_AGENT = "PromptjoyRubyGem/#{PromptjoyRuby::VERSION}"

    def initialize(api_key, url, logger: Logger.new(STDOUT))
      @api_key = api_key
      @url = url
      @logger = logger
    end

    def call(api_data, client_ip = nil, referrer = nil)
      uri = URI(@url)
      http = Net::HTTP.new(uri.host, uri.port)
      
      if uri.scheme == 'https'
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_PEER
      end
      
      @logger.debug "URI: #{uri}"
      @logger.debug "API Data: #{api_data}"
      
      request = Net::HTTP::Post.new(uri)
      
      request['Authorization'] = "Bearer #{@api_key}"
      request['Client-Ip'] = client_ip if client_ip
      request['User-Agent'] = USER_AGENT
      request['Referrer'] = referrer if referrer
      request.body = api_data.to_json
      request['Content-Type'] = 'application/json'
      
      response = http.request(request)
      handle_response(response)
    end

    private

    def handle_response(response)
      case response
      when Net::HTTPSuccess
        JSON.parse(response.body)
      when Net::HTTPUnauthorized
        raise Error.new("API call failed due to unauthorized access. Check your API key.")
      else
        raise Error.new("API call failed with HTTP #{response.code} #{response.message}")
      end
    end
  end
end
