class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :host

  has_attached_file :event_avatar, styles: {
    large: "800x800", medium: "300x200", small: "260x180", thumb: "80x80"
  }

  validates_attachment_content_type :event_avatar, :content_type => /\Aimage\/.*\Z/

  extend SimpleCalendar
  has_calendar
end
