class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.string :title,        null: false
      t.text :content,        null: false
      t.datetime :deadline,   null: false
      t.string :location,     null: false, default: ""
      t.string :type,         null: false
      t.timestamps
    end
  end
end
