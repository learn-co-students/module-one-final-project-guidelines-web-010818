class User < ActiveRecord::Base
  has_many :favorites
  has_many :stretches, through: :favorites
  
  has_many :user_muscle_groups
  has_many :muscle_groups, through: :user_muscle_groups
end
