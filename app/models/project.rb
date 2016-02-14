class Project < ActiveRecord::Base
  include Paperclip::Glue
  has_many :events
  belongs_to :user
  has_attached_file :cover, styles: { medium: "400x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png", 
    url: "/images/projects/:attachment/:id/:style_:filename",
    path: ":rails_root/public/images/projects/:attachment/:id/:style_:filename"

  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/

  validates :title, :cover, presence: true
end