class MarketplaceTransactions < ActiveRecord::Base
  belongs_to :users
  belongs_to :items
end
