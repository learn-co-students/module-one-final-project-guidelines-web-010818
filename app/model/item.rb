class Item < ActiveRecord::Base
  has_many :users
  has_many :companies
  has_many :marketplace_transactions, through: :users
  has_many :store_transactions, through: :companies
end
