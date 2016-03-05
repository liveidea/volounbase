class Event < ActiveRecord::Base
  has_many :candidates
  belongs_to :project

  STATUSES = ["public", "private", "archive"]

  validates :note, :start_date, :end_date, :presence => true

  validate :start_date_is_valid_datetime

  validate :end_date_is_valid_datetime

  validate :start_and_end_date_is_valid

  validates :status, :presence => true, :inclusion => { :in => STATUSES }


  private
    def start_date_is_valid_datetime
      errors.add(:start_date, 'must be a valid datetime') if ((DateTime.parse(start_date.to_s) rescue ArgumentError) == ArgumentError)
    end

    def end_date_is_valid_datetime
      errors.add(:end_date, 'must be a valid datetime') if ((DateTime.parse(end_date.to_s) rescue ArgumentError) == ArgumentError)
    end

    def start_and_end_date_is_valid
      return if errors.any?
      errors.add(:start_date, 'must be a less end date') if (start_date.to_time.to_i > end_date.to_time.to_i)
    end
end
