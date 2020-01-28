# This file is used by Rack-based servers to start the application.
require 'http_accept_language'
require_relative 'config/environment'

use HttpAcceptLanguage::Middleware
run Rails.application
