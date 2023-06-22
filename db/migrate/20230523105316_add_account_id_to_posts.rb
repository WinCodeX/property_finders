class AddAccountIdToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :account_id, :integer
    add_index :posts, :account_id
  end
end
