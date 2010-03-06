# coding: utf-8

module Delayed
  module Mailer

    def self.included(base)
      class << base
        alias_method :original_method_missing, :method_missing

        def method_missing(method_symbol, *params)
          if (/^deliver_([_a-z!]\w*)(?!\!)$/ =~ method_symbol.to_s)
            send_later("#{method_symbol}!", *params)
          else
            original_method_missing(method_symbol, *params)
          end
        end
      end
    end

  end
end