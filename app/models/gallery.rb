class Gallery < ActiveRecord::Base
  belongs_to :project
  has_many :photos
end
