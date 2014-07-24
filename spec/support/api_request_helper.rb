module Requests
  module JsonHelpers
    def app
      Rails.application
    end

    def json
      @json ||= JSON.parse(last_response.body, {:symbolize_names => true})
    end
  end
end
