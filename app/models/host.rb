class Host < ActiveRecord::Base
  belongs_to :user
  has_many :events

  has_attached_file :host_avatar, styles: {
    large: "800x800", medium: "300x200", small: "260x180", thumb: "80x80"
  }

  validates_attachment_content_type :host_avatar, :content_type => /\Aimage\/.*\Z/
end
