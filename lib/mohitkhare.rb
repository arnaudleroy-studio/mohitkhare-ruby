# frozen_string_literal: true

# MohitKhare - Developer utilities and text analysis tools
# https://mohitkhare.me
#
# Token estimation, word counting, and text helpers for Ruby projects.

module MohitKhare
  VERSION = '0.1.1'

  BASE_URL = 'https://mohitkhare.me'

  DESCRIPTION = 'Developer utilities for text analysis and token estimation, extracted from mohitkhare.me tooling.'

  ENDPOINTS = {
    home: '/',
    blog: '/blog',
    projects: '/projects'
  }.freeze

  @config = {}

  # Returns library metadata
  def self.info
    {
      name: 'MohitKhare',
      version: VERSION,
      base_url: BASE_URL,
      description: DESCRIPTION,
      endpoints: ENDPOINTS.keys
    }
  end

  # Returns available endpoint paths
  def self.endpoints
    ENDPOINTS
  end

  # Estimate token count for a string (LLM-style ~4 chars/token heuristic)
  #
  # @param text [String] the input text
  # @return [Integer] estimated token count
  def self.estimate_tokens(text)
    return 0 if text.nil? || text.empty?
    (text.length / 4.0).ceil
  end

  # Count words in a string
  #
  # @param text [String] the input text
  # @return [Integer] word count
  def self.word_count(text)
    return 0 if text.nil? || text.empty?
    text.split(/\s+/).reject(&:empty?).length
  end

  # Block-based configuration
  def self.configure
    yield @config if block_given?
    @config
  end

  # Read current configuration
  def self.config
    @config
  end

  # Returns the current library version
  def self.version
    VERSION
  end

  # Returns the base URL
  def self.base_url
    BASE_URL
  end
end
