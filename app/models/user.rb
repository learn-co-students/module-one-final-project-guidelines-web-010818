class User < ActiveRecord::Base
  has_many :favorites
  has_many :stretches, through: :favorites

  has_many :user_muscle_groups
  has_many :muscle_groups, through: :user_muscle_groups


   @@workout = []


  def add_to_workout(user_stretch_id) #just integer of stretch_id
    stretch = Stretch.find(user_stretch_id)
    @@workout << stretch
  end

  def workout
    @@workout
  end

end
