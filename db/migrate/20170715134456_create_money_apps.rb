class CreateMoneyApps < ActiveRecord::Migration[5.0]
  def change
    create_table :money_apps do |t|
      t.string :title
      t.text :content
      t.datetime :deadline
      t.integer :total_money
      t.timestamps
    end
  end
end
