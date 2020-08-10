class ApplicationController < ActionController::Base
    before_action :basic_auth

    private

    def basic_auth
        authenticate_or_request_with_http_basic do |username, password|
        BASIC_AUTH_USERNAME="furima" BASIC_AUTH_PASSWORD="28283"
        end
    end
end
