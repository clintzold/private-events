class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :attendances, foreign_key: "attended_event_id"
  has_many :attendees, through: :attendances, foreign_key: "attended_event_id", source: :user

  has_many :invitations, foreign_key: "invited_to_id"
  has_many :invitees, through: :invitations, source: :user
end
