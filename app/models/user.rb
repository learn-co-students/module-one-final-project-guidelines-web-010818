class User < ActiveRecord::Base
  has_many :user_muscle_groups
  has_many :muscle_groups, through: :user_muscle_groups

  has_many :user_workouts
  has_many :workouts, through: :user_workouts


  def star_fav_stretch(stretch_id)
    Favorite.new(user_id: self.id, stretch_id: stretch_id)
    fav_stretch = Stretch.find(stretch_id)
    fav_stretch.stars_count += 1
  end






end
