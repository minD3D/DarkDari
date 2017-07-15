class CreateLocationApps < ActiveRecord::Migration[5.0]
  def change
    create_table :location_apps do |t|
      t.string :title
      t.text :content
      t.datetime :deadline
      t.string :location
      t.timestamps
    end
  end
end
