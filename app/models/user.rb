class User < ActiveRecord::Base
  include Paperclip::Glue
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :projects
  has_attached_file :avatar, styles: { thumb: "200x200>" }, default_url: "/images/users/noavatar.png", 
    url: "/images/users/:id_:filename",
    path: ":rails_root/public/images/users/:id_:filename"
    
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/  
end
