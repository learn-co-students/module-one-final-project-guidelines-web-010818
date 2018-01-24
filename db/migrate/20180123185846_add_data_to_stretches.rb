class AddDataToStretches < ActiveRecord::Migration[5.0]
  def change
    Stretch.create(name: "Hamstring Stretch", time_in_sec: 10, stars_count: 0,
      instructions: "1. Bend your knees like you're squatting.
2. Place your hands on a raised surface.
3. Keep the arms straight and drive the butt to the ceiling straightening the knees.")
    Stretch.create(name: "Glute Stretch", time_in_sec: 20, stars_count: 0,
      instructions: "1. Setup into a standard Pigeon Pose
2. Cross your arms across your shoulders!
3. Place your back foot on something that can slide!
4. Switch sides and repeat.")
    Stretch.create(name: "Squat", time_in_sec: 20, stars_count: 0,
      instructions: "1. Place a band around the knees.
2. Squat down, pushing the knees out.
3. Keep the heels on the ground and reach up towards the sky.
4. Repeat!")
    Stretch.create(name: "Spine Mobility", time_in_sec: 10, stars_count: 0,
      instructions: "1. Find a seat (on the ground or on a chair)
2. While seated, extend the arms and grab ‪the shins‬ or knees.
3. Look up and push your chest forward.
4. Look down and round your back.
5. Repeat!")
  end
end
