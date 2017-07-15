class CreateMoneyInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :money_infos do |t|
      t.belongs_to :user
      t.belongs_to :money_app
      t.integer :money, default: 0
      t.boolean :done, default: false
      t.boolean :builder, default: false
      t.timestamps
    end
  end
end
