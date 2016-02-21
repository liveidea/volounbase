class Candidate < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  paginates_per 10

  def is_invited
    Candidate.where(event:self).where(user_id:current_user).empty?
  end

end
