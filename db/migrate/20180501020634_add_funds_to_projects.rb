class AddFundsToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :funds, :integer
  end
end
