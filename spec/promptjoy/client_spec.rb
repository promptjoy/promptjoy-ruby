# spec/client_spec.rb

require 'spec_helper'

describe PromptjoyRuby::Client do
  let(:api_key) { 'my_api_key' }
  let(:client) { PromptjoyRuby::Client.new(api_key) }

  describe '#initialize' do
    context 'when an API key is provided' do
      it 'sets the API key' do
        expect(client.instance_variable_get('@api_key')).to eq(api_key)
      end
    end
  end

  describe '#find_by_api_url' do
    let(:url) { 'http://localhost:8888/api/DgwCZk' }
    let(:api) { client.find_by_api_url(url) }

    it 'returns an Api instance' do
      expect(api).to be_an_instance_of(PromptjoyRuby::Api)
    end

    it 'sets the Api key and url' do
      expect(api.instance_variable_get('@api_key')).to eq(api_key)
      expect(api.instance_variable_get('@url')).to eq(url)
    end
  end
end
