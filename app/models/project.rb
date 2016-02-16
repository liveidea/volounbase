class Project < ActiveRecord::Base
  include Paperclip::Glue
  has_many :events, dependent: :destroy
  belongs_to :user
  has_attached_file :cover, styles: { medium: "400x300>", thumb: "100x100>" }, default_url: "/assets/images/missing/img.png",
    url: "/images/projects/:attachment/:id/:style_:filename",
    path: ":rails_root/public/images/projects/:attachment/:id/:style_:filename"

  accepts_nested_attributes_for :events, allow_destroy: true

  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/

  paginates_per 10

  validates :title, :cover, presence: true
  validates_associated :events
end

