class Company

  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :address, type: String
  field :city, type: String
  field :country, type: String
  field :email, type: String
  field :phone, type: String

  embeds_many :directors, class_name: 'Person'
  embeds_many :owners, class_name: 'Person'

end
