class AddContractToProjectBackers < ActiveRecord::Migration[5.1]
  def change
    add_column :project_backers, :contract, :string
  end
end
