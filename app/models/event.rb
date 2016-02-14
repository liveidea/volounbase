class Event < ActiveRecord::Base
  has_many :candidates
  belongs_to :project
  
  validates :note, :start_date, :end_date, :presence => true
end
