class CreateUserRewards < ActiveRecord::Migration[5.1]
  def change
    create_table :user_rewards do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :reward, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
