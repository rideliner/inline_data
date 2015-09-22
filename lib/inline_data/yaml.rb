
require 'yaml'
require 'inline_data/db'

module InlineData
  class YAML < DB
    protected

    def load
      ::YAML::load @file
    end
    
    def dump
      ::YAML::dump @data
    end
  end
end
