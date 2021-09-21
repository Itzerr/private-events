class AddInviteOnlyToEvent < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :invite_only, :boolean
  end
end
