class User < ActiveRecord::Base
  include Paperclip::Glue
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :projects
  has_many :candidates
  has_attached_file :avatar, styles: { thumb: "200x200>" }, default_url: "/images/missing/noavatar.png",
    url: "/images/users/:id_:filename",
    path: ":rails_root/public/images/users/:id_:filename"

  def candidate_to_event(event)
    Candidate.where(event: event, user_id: self.id).last
  end

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
