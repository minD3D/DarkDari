class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|

      t.belongs_to :user
      t.belongs_to :requester
      t.belongs_to :appointment
      t.string :type
      t.string :message
      t.timestamps
    end
  end
end
