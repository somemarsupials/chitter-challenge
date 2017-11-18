ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'models/db-setup'
require_relative 'models/user'

require_relative 'server'
require_relative 'controllers/login'
require_relative 'controllers/signup'
require_relative 'controllers/peeps'
