# frozen_string_literal: true

require_relative "lib/log_facility/version"

Gem::Specification.new do |spec|
  spec.name = "log_facility"
  spec.version = LogFacility::VERSION
  spec.authors = ["Andrew Hood"]
  spec.email = ["andrewhood125@gmail.com"]
  spec.summary = "Logging w/extended features: rotation, truncation, custom levels"

  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"
end
