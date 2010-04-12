# coding: utf-8

module Delayed
  module Mailer

    def self.included(base)

      class << base
        alias_method :original_method_missing, :method_missing
      
        def method_missing(method_symbol, *params, &block)
          method_name = method_symbol.to_s
      
          case method_name
            when /^deliver_([_a-z]\w*)$/
              send_later(method_name, *params, &block)
            when /^deliver_([_a-z]\w*)!$/
              original_method_missing(method_name.gsub(/!$/,""), *params, &block)
            else
              original_method_missing(method_name, *params, &block)
          end
        end
      
      end #close eigen class

    end #close hook

  end
end