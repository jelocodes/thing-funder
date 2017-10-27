class CreateRewardTiers < ActiveRecord::Migration[5.1]
  def change
    create_table :reward_tiers do |t|

      t.timestamps
    end
  end
end
