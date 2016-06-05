class Business
  include Mongoid::Document
  field :_id, type: Integer
  field :uuid, type: String
  field :name, type: String
  field :address, type: String
  field :address2, type: String
  field :city, type: String
  field :state, type: String
  field :zip, type: String
  field :country, type: String
  field :phone, type: String
  field :created_at, type: String
end
