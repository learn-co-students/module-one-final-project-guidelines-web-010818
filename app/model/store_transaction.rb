class StoreTransactions < ActiveRecord::Base
  belongs_to :companies
  belongs_to :items
end
