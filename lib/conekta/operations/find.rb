module Conekta
  module Operations
    module Find
      module ClassMethods
        def find(api_key, id)
          instance = self.new(id)
          response = Requestor.new(api_key).request(:get, instance._url)
          instance.load_from(response)
          instance.api_key = api_key
          instance
        end

        # <b>DEPRECATED:</b> Please use <tt>find</tt> instead.
        alias_method :retrieve, :find
      end
      def self.included(base)
        base.extend(ClassMethods)
      end
    end
  end
end
