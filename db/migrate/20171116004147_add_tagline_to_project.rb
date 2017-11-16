class AddTaglineToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :tagline, :string
  end
end
