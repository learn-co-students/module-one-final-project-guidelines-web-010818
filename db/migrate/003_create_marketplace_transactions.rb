class CreateMarketplaceTransactions < ActiveRecord::Migration[4.2]

  def change
    create_table :marketplace_transactions do |t|
      t.integer :user_id
      t.integer :item_id
      t.datetime :transaction_time
    end
  end
end
