class Candidate < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  paginates_per 10

end
