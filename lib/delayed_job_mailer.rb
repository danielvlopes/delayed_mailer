# coding: utf-8

module Delayed
  module Mailer
    def self.included(base)
      base.extend self
    end

    def method_missing(method_symbol, *params)
      case method_symbol.id2name
        when /^deliver_([_a-z]\w*)\!/ then super(method_symbol, *params)
        when /^deliver_([_a-z]\w*)/ then self.send_later(method_symbol.to_s + '!', *params)
      else
        super(method_symbol, *params)
      end
    end

  end
end