class AddGoalToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :goal, :integer
  end
end
