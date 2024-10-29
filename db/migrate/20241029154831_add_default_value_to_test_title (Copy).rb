class AddDefaultValueToTestTitle < ActiveRecord::Migration[7.2]
  def change
    change_column_default :tests, :title, to: 'undefined'
  end
end
