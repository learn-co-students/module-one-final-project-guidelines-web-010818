class User < ActiveRecord::Base
  has_many :favorites
  has_many :stretches, through: :favorites


  def save_fav_stretch_by_stretch_id(id)
    Favorite.create(user_id: self.id, stretch_id: id)
  end



  def display_fav_stretches
    relationships = Favorite.where("user_id = ?", self.id)
    relationships.map do |user_stretch|
       stretch = Stretch.find(user_stretch.stretch_id)
       "#{stretch.id}. #{stretch.name}"
    end
  end




end
