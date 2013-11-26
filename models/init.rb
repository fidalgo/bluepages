require 'mongoid'
require_relative 'company'
require_relative 'person'


Mongoid.load!(File.expand_path('../../config/mongoid.yml', __FILE__))
