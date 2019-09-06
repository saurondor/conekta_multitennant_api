module Conekta
  module Operations
    module Create
      module ClassMethods
        def create(api_key, params)
          _url = Util.types[self.class_name.downcase]._url
          response = Requestor.new(api_key).request(:post, _url, params)
          instance = self.new
          instance.load_from(response)
          instance.api_key = api_key
          instance
        end
      end
      def self.included(base)
        base.extend(ClassMethods)
      end
    end
  end
end
