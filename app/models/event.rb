class Event < ActiveRecord::Base
  has_many :candidates
  belongs_to :project
end
