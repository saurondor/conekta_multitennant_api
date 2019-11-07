module Conekta
  module Operations
    module Update
      def update(api_key,params)
        response = Requestor.new(api_key).request(:put, self._url, params)
        self.load_from(response)
        self
      end
    end
  end
end
