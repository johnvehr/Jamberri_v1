class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :host

  extend SimpleCalendar
  has_calendar
end
