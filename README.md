# MohitKhare

[![Gem Version](https://badge.fury.io/rb/mohitkhare.svg)](https://rubygems.org/gems/mohitkhare)

A small collection of developer utilities extracted from the tools and workflows behind mohitkhare.me. The site is a developer portfolio focused on AI engineering, full-stack development, and technical writing. This gem packages a few of those utilities for reuse in Ruby projects -- primarily text analysis helpers and token estimation for working with large language models.

## Installation

```
gem install mohitkhare
```

Or add `gem 'mohitkhare'` to your Gemfile and run `bundle install`.

## Usage

### Token Estimation

When working with LLM APIs, knowing approximate token counts before sending requests helps manage costs and stay within context windows. The estimator uses the standard ~4 characters per token heuristic:

```ruby
require 'mohitkhare'

text = "Ruby is a dynamic, open source programming language."
estimate = MohitKhare.estimate_tokens(text)
puts estimate  # => 14
```

### Text Analysis

Basic readability and word statistics for content work:

```ruby
stats = MohitKhare.word_count("The quick brown fox jumps over the lazy dog.")
puts stats  # => 9

long_text = File.read("article.md")
puts "Tokens: ~#{MohitKhare.estimate_tokens(long_text)}"
puts "Words: #{MohitKhare.word_count(long_text)}"
```

### Library Info

```ruby
MohitKhare.info
# => { name: "MohitKhare", version: "0.1.1", base_url: "https://mohitkhare.me", ... }

MohitKhare.endpoints.each do |section, path|
  puts "#{section}: #{MohitKhare::BASE_URL}#{path}"
end
```

## What's on the Site

The portfolio covers projects in AI/ML tooling, web development, and data engineering. The blog section includes write-ups on prompt engineering patterns, deployment strategies, and developer productivity. Tools and open-source contributions are documented with source links and usage notes.

## Links

- [mohitkhare.me](https://mohitkhare.me) -- portfolio, blog, and tools
- [Blog](https://mohitkhare.me/blog) -- technical writing on AI and dev tooling
- [Source Code](https://github.com/arnaudleroy-studio/mohitkhare-ruby)

## License

MIT
