class AddPendingExpertToUser < ActiveRecord::Migration
  def change
    add_column :users, :pending_expert, :boolean
  end
end
