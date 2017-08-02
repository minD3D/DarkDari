class CreateInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :infos do |t|
      t.belongs_to :user
      t.belongs_to :appointment
      t.integer :money,         default: '0'
      t.boolean :done,          default: false
      t.boolean :builder,       default: false
      t.timestamps
    end
  end
end
