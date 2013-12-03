require_relative 'document_uploader'
class Person

  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  embedded_in :owners, class_name: "Company"
  embedded_in :directors, class_name: "Company"
  mount_uploader :document, DocumentUploader
end
