class AddTxHashToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :tx_hash, :string
  end
end
