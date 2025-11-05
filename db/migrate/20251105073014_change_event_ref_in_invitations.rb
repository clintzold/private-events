class ChangeEventRefInInvitations < ActiveRecord::Migration[8.0]
  def change
    rename_column :invitations, :event_id, :invited_to_id
  end
end
