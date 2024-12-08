class AddColumnsToTestPassages < ActiveRecord::Migration[7.2]
  def change
    add_column :test_passages, :passed, :boolean, default: false
  end
end
