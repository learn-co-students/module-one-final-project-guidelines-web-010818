class User < ActiveRecord::Base
  has_many :user_muscle_groups
  has_many :muscle_groups, through: :user_muscle_groups

  has_many :user_workouts
  has_many :workouts, through: :user_workouts



  def add_stretch_to_fav(user_input_fav)
    Favorite.new(user_id: self.id, stretch_id: user_input_fav)
    fav_stretch = Stretch.find(user_input_fav)
    fav_stretch.stars_count += 1
  end






end
