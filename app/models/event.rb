class Event < ApplicationRecord
  scope :past, -> { where("date < ?", Time.now) }
  scope :upcoming, -> { where("date > ?", Time.now) }

  belongs_to :creator, class_name: "User"
  has_many :attendances, foreign_key: "attended_event_id"
  has_many :attendees, through: :attendances, foreign_key: "attended_event_id", source: :user

  has_many :invitations, foreign_key: "invited_to_id"
  has_many :invitees, through: :invitations, source: :user

  # def self.past
  #   where("date < ?", Time.now)
  # end

  # def self.upcoming
  #   where("date > ?", Time.now)
  # end
end
