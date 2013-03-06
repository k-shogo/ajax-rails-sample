class Nyan
  include Mongoid::Document
  include Mongoid::Timestamps
  mount_uploader :image, ImageUploader

  attr_accessible :title, :image, :image_cache, :remove_image
  field :title, type: String
  validates_presence_of :title
end
