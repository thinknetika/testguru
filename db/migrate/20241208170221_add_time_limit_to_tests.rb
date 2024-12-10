class AddTimeLimitToTests < ActiveRecord::Migration[7.2]
  def self.up
    add_column :tests, :time_limit, :integer, null: false, default: 0

    execute "UPDATE tests SET time_limit = 0"
  end

  def self.down
    remove_column :tests, :time_limit
  end
end
