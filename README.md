# PromptJoy Ruby Gem

Welcome to the official Ruby client for the [PromptJoy](https://promptjoy.com).

PromptJoy is a platform that enables you to build scalable APIs by simply describing what you want. This client helps you interact with PromptJoy in a Ruby-friendly way.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'promptjoy-ruby'
```

And then execute:

```bash
bundle install
```

Or install it yourself as:

```bash
gem install promptjoy-ruby
```



## Usage

```ruby
require 'promptjoy-ruby'

client = PromptjoyRuby::Client.new('your_api_key')


```

You can find the API you want to interact with by using its URL:

```ruby
api = client.find_by_api_url('https://api.promptjoy.com/test-endpoint')
```



To call the API, pass in the data as a Hash:

```ruby
response = api.call({
  key1: 'value1',
  key2: 'value2'
})
```



## Error Handling

If an error occurs during an API call, an instance of PromptjoyRuby::Error is raised with a message indicating the nature of the error.

```ruby
begin
  api.call(some_data)
rescue PromptjoyRuby::Error => e
  puts "An error occurred: #{e.message}"
end
```




## More about PromptJoy

Please email any feedback to team@promptjoy.com.



## License

The gem is available as open source under the terms of the MIT License.
