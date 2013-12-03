require 'mongoid'
require_relative 'company'
require_relative 'person'
require_relative 'document_uploader'

Mongoid.load!(File.expand_path('../../config/mongoid.yml', __FILE__))

module Mongoid
  module Document
    def as_json(options={})
      attrs = super(options)
      attrs["id"] = attrs["_id"]
      attrs
    end
  end
end
