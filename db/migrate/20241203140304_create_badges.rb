class CreateBadges < ActiveRecord::Migration[7.2]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :rule_name, null: false
      t.string :rule_value, null: false, default: '0'

      t.timestamps
    end
  end
end
