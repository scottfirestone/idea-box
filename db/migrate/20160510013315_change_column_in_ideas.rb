class ChangeColumnInIdeas < ActiveRecord::Migration
  def up
    change_column :ideas, :quality, :integer, default: 0
  end
end
