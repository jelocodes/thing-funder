class CreateRewardTiers < ActiveRecord::Migration[5.1]
  def change
    create_table :reward_tiers do |t|
      t.string :pledge_requirement 
      t.string :name 
      t.text :description 
      t.integer :backer_amount
      t.timestamps
    end
  end
end