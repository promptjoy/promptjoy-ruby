# PromptJoy Ruby Gem

Welcome to the official Ruby client for the [PromptJoy](https://promptjoy.com).

[PromptJoy](https://promptjoy.com) is a platform that enables you to build scalable APIs by simply describing what you want. 

Example APIs built on [PromptJoy](https://promptjoy.com):
* Travel recommendation https://promptjoy.com/apis/mPBCOr
* TV show -> podcast recommendation: https://promptjoy.com/apis/mxqCWW
* Schema transformation: https://promptjoy.com/apis/jn8Cep
* Book search engine: https://promptjoy.com/apis/mVMCpq
  

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

You can find the API you want to interact with by using its URL. You can find the URL in the endpoint field of the API's page:

```ruby
api = client.find_by_api_url('https://api.promptjoy.com/api/id')
```

You can also just find the API by its id:
```ruby
api = client.find('id')
```


To call the API, pass in the data as a Hash:

```ruby
response = api.call({
  key1: 'value1',
  key2: 'value2'
})
```

## Example

The following example uses PromptJoy to build an API that recommends an open-source software package based on a problem to be solved: https://promptjoy.com/apis/jNqC7A

``` ruby
> require 'promptjoy-ruby'
> client = PromptjoyRuby::Client.new('***********************')
> api = client.find_by_api_url('https://api.promptjoy.com/api/jNqC7A')
> response = api.call({problem: "queue processing in ruby"})
> puts response

{"software"=>"Sidekiq", "reason"=>"Efficient and reliable background processing 
for Ruby", "github_url"=>"https://github.com/mperham/sidekiq"}
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
