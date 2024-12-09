class AddStartedAtToTestPassages < ActiveRecord::Migration[7.2]
  def change
    add_column :test_passages, :started_at, :datetime
  end
end
