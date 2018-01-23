class Stretch < ActiveRecord::Base
  has_many :favorites
  has_many :users, through: :favorites
  
  has_many :stretch_muscle_group
  has_many :muscle_groups, through: :stretch_muscle_group
end
