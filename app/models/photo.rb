class Photo < ActiveRecord::Base
	belongs_to :gallery

	include Paperclip::Glue
  has_attached_file :image, styles: { medium: "400x300#", large: "1920x1080>" }, default_url: "/images/missing/img.png",
    url: "/images/photos/:attachment/:id/:style_:filename",
    path: ":rails_root/public/images/photos/:attachment/:id/:style_:filename"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
