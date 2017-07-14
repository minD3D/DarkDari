class CreateMoneyapps < ActiveRecord::Migration[5.0]
  def change
    create_table :moneyapps do |t|

      t.timestamps
    end
  end
end
