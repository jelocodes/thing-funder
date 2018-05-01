class AddNumberClaimedToReward < ActiveRecord::Migration[5.1]
  def change
    add_column :rewards, :number_claimed, :integer
  end
end
