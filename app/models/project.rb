class Project < ActiveRecord::Base
  has_many :events
  belongs_to :user

  validates :title, presence: true
end