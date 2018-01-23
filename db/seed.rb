#Seed Suspects (15)
Suspect.create( name: "Harrowing Harry",
  gender: "male",
  hair_color: "black",
  eye_color: "brown",
  vehicle: "motorcycle",
  favorite_food: "Russian" )
Suspect.create( name: "Sniper Sally",
  gender: "female",
  hair_color: "blond",
  eye_color: "blue",
  vehicle: "electric car",
  favorite_food: "Chinese" )
Suspect.create( name: "Criminal Clarence",
  gender: "male",
  hair_color: "red",
  eye_color: "blue",
  vehicle: "blue sedan",
  favorite_food: "Thai" )
Suspect.create( name: "Andrew The Awful",
  gender: "male",
  hair_color: "brown",
  eye_color: "brown",
  vehicle: "beat up truck",
  favorite_food: "hamburgers" )
Suspect.create( name: "Bad Barry",
  gender: "male",
  hair_color: "black",
  eye_color: "green",
  vehicle: "mercedes",
  favorite_food: "French" )
Suspect.create( name: "Dastardly David",
  gender: "male",
  hair_color: "brown",
  eye_color: "blue",
  vehicle: "scooter",
  favorite_food: "Mexican" )
Suspect.create( name: "Edward Evil",
  gender: "male",
  hair_color: "white",
  eye_color: "hazel",
  vehicle: "white Jeep",
  favorite_food: "Pizza" )
Suspect.create( name: "Feckless Fran",
  gender: "female",
  hair_color: "black",
  eye_color: "brown",
  vehicle: "red sedan",
  favorite_food: "Pizza" )
Suspect.create( name: "Ghastly Gertrude",
  gender: "female",
  hair_color: "red",
  eye_color: "green",
  vehicle: "motorcycle",
  favorite_food: "Chinese" )
Suspect.create( name: "Irritating Ivan",
  gender: "male",
  hair_color: "black",
  eye_color: "blue",
  vehicle: "bicycle",
  favorite_food: "hot dogs" )
Suspect.create( name: "Jowly Janet",
  gender: "female",
  hair_color: "brown",
  eye_color: "green",
  vehicle: "truck",
  favorite_food: "hamburgers" )
Suspect.create( name: "Killer Kyle",
  gender: "male",
  hair_color: "blond",
  eye_color: "blue",
  vehicle: "sedan",
  favorite_food: "Italian" )
Suspect.create( name: "Dastardly David",
  gender: "male",
  hair_color: "brown",
  eye_color: "blue",
  vehicle: "black scooter",
  favorite_food: "Mexican" )
Suspect.create( name: "Lily-Livered Lily",
  gender: "female",
  hair_color: "white",
  eye_color: "green",
  vehicle: "motorcycle",
  favorite_food: "Chinese" )
Suspect.create( name: "Moody Monique",
  gender: "female",
  hair_color: "black",
  eye_color: "blue",
  vehicle: "truck",
  favorite_food: "Italian" )

  #Seed Neighborhoods (Look up list)
  tribeca = Neighborhood.create(name: "Tribeca")

  #Seed Stores (3 per neighborhood)
  tribeca.stores << Store.create(name: "Bodega", witness: "clerk")
  # tribeca.store = Store.create(name: "Bodega", witness: "clerk")
  # tribeca.store = Store.create(name: "Bodega", witness: "clerk")

  #Seed Clues (Maybe 10 per neighborhood)
  tribeca.clues << Clue.create(text: "The is a really useful clue.")
