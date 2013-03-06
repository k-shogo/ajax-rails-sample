class Nyan
  include Mongoid::Document
  include Mongoid::Timestamps
  include Rails.application.routes.url_helpers
  mount_uploader :image, ImageUploader

  attr_accessible :title, :image, :image_cache, :remove_image
  field :title, type: String
  validates_presence_of :title

  def to_jq_upload
    {
      "name" => read_attribute(:image),
      "size" => image.size,
      "url" => image.url,
      "thumbnail_url" => image.thumb.url,
      "delete_url" => nyan_path(:id => id),
      "delete_type" => "DELETE"
    }
  end

  before_create :default_title

  def default_title
    self.title ||= File.basename(image.filename, '.*') if image
  end
end
