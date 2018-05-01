class CreateProjectBackers < ActiveRecord::Migration[5.1]
  def change
    create_table :project_backers do |t|
      t.belongs_to :project, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end