class Project < ActiveRecord::Base
  def to_param
    "#{id}-#{title.parameterize}"
  end  
  include Paperclip::Glue
  has_many :events, dependent: :destroy
  has_many :galleries, dependent: :destroy
  belongs_to :user
  has_attached_file :cover, styles: { medium: "400x300#", large: "1920x1080>" }, default_url: "/images/missing/img.png",
    url: "/images/projects/:attachment/:id/:style_:filename",
    path: ":rails_root/public/images/projects/:attachment/:id/:style_:filename"

  accepts_nested_attributes_for :events, allow_destroy: true

  paginates_per 9

  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
  validates :title, :cover, presence: true
  validates_associated :events

end

