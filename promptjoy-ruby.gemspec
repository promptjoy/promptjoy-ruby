require_relative "lib/promptjoy-ruby/version"

Gem::Specification.new do |spec|
  spec.name = "promptjoy-ruby"
  spec.version = PromptjoyRuby::VERSION
  spec.authors = ["PromptJoy Team"]
  spec.email = ["team@promptjoy.com"]

  spec.summary = "Official PromptJoy Ruby Gem."
  spec.description = %q{The PromptJoy ruby gem provides a simple and efficient way to interact with the PromptJoy API in Ruby. It handles the API authentication, request formation, and response parsing, providing the users with an intuitive interface to make API calls and retrieve the data.}

  spec.homepage = "https://promptjoy.com"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata = {
    "homepage_uri" => "https://promptjoy.com",
    "bug_tracker_uri" => "https://github.com/promptjoy/promptjoy-ruby/issues",
    "documentation_uri" => "https://docs.promptjoy.com",
    "changelog_uri" => "https://github.com/promptjoy/promptjoy-ruby/blob/main/Changes.md",
    "source_code_uri" => "https://github.com/promptjoy/promptjoy-ruby",
    "rubygems_mfa_required" => "true"
  }
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Add rspec and webmock as development dependencies
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 3.0"
end
