class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.text :bio
      t.string :twitter
      t.string :facebook
      t.string :website
      t.timestamps
    end
  end
end
