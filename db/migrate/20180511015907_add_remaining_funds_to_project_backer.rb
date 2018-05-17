class AddRemainingFundsToProjectBacker < ActiveRecord::Migration[5.1]
  def change
    add_column :project_backers, :times_backed, :integer
  end
end
