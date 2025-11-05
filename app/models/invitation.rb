class Invitation < ApplicationRecord
  belongs_to :user, foreign_key: "invitee_id"
  belongs_to :event, foreign_key: "invited_to_id"
end
