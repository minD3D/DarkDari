class CreateLocationapps < ActiveRecord::Migration[5.0]
  def change
    create_table :locationapps do |t|

      t.timestamps
    end
  end
end
