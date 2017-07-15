class CreateLocationInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :location_infos do |t|
      t.belongs_to :user
      t.belongs_to :location_app
      t.string :current_location
      t.boolean :done, default: false
      t.boolean :builder, default: false
      t.timestamps
    end
  end
end
