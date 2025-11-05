class User < ApplicationRecord
  has_many :events, foreign_key: "creator_id", class_name: "Event"
  has_many :attendances, foreign_key: "attendee_id"
  has_many :attended_events, through: :attendances, foreign_key: "attendee_id", source: :event

  has_many :invitations, foreign_key: "invitee_id"
  has_many :invited_tos, through: :invitations, source: :event
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
