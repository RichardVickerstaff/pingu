module Requests
  module JsonHelpers
    def app
      Rails.application
    end

    def json
      @json ||= JSON.parse(response.body)
    end
  end
end
