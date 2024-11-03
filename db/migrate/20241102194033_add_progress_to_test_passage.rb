class AddProgressToTestPassage < ActiveRecord::Migration[7.2]
  def change
    add_column :test_passages, :progress, :integer, null: false, default: 0
  end
end
