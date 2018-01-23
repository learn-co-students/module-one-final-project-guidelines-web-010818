class Company < ActiveRecord::Base
  has_many :store_transactions
  has_many :items, through: :store_transactions
  has_many :users
  has_many :marketplace_transactions, through: :users
end
