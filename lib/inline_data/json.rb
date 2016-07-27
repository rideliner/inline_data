
require 'json'
require 'inline_data/db'

module InlineData
  class JSON < DB
    protected

    def load
      ::JSON.load @file
    end

    def dump
      ::JSON.generate @data
    end
  end
end
