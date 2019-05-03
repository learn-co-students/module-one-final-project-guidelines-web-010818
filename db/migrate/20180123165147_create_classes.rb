class CreateClasses < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
    end

    create_table :stretches do |t|
      t.string :name
      t.integer :time_in_sec
      t.integer :star_count
      t.text :instructions
      t.string :picture_link
    end

    create_table :muscle_groups do |t|
      t.string :name
    end

    create_table :stretch_muscle_groups do |t|
      t.integer :stretch_id
      t.integer :muscle_group_id
    end

    create_table :favorites do |t|
      t.integer :user_id
      t.integer :stretch_id
    end

  end
end
