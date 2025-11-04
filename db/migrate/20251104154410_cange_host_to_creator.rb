class CangeHostToCreator < ActiveRecord::Migration[8.0]
  def change
    rename_column :events, :host_id, :creator_id
  end
end
