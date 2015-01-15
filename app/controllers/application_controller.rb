# Copyright (c) 2012 Livefront, Inc.
# See the file license.txt for copying permission.

class ApplicationController < ActionController::Base
  protect_from_forgery
  http_basic_authenticate_with name: Rails.configuration.http_basic_auth_name, password: Rails.configuration.http_basic_auth_password
end
