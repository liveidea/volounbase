require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "start date should not be equal end date" do
    event_1 = events(:event_one)
    event_2 = events(:event_two)
    assert_not_equal event_1.start_date, event_1.end_date
    assert_not_equal event_2.start_date, event_2.end_date
  end
end
