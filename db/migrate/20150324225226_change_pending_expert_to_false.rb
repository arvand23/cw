class ChangePendingExpertToFalse < ActiveRecord::Migration
  def change
  	change_column :users, :pending_expert, :boolean, :default => false
  end
end
