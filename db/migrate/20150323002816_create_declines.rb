class CreateDeclines < ActiveRecord::Migration
  def change
    create_table :declines do |t|
      t.integer :user_id
      t.integer :booking_id

      t.timestamps
    end
  end
end
