class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :about
      t.text :faq
      t.text :risk_and_challenges
      t.date :deadline
      t.timestamps
    end
  end
end
