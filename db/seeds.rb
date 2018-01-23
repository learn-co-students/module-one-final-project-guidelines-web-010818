#Seed Suspects (15)
Suspect.find_or_create_by( name: "Harrowing Harry",
  gender: "male",
  hair_color: "black",
  eye_color: "brown",
  vehicle: "motorcycle",
  favorite_food: "Russian" )
Suspect.find_or_create_by( name: "Sniper Sally",
  gender: "female",
  hair_color: "blond",
  eye_color: "blue",
  vehicle: "electric car",
  favorite_food: "Chinese" )
Suspect.find_or_create_by( name: "Criminal Clarence",
  gender: "male",
  hair_color: "red",
  eye_color: "blue",
  vehicle: "blue sedan",
  favorite_food: "Thai" )
Suspect.find_or_create_by( name: "Andrew The Awful",
  gender: "male",
  hair_color: "brown",
  eye_color: "brown",
  vehicle: "beat up truck",
  favorite_food: "hamburgers" )
Suspect.find_or_create_by( name: "Bad Barry",
  gender: "male",
  hair_color: "black",
  eye_color: "green",
  vehicle: "mercedes",
  favorite_food: "French" )
Suspect.find_or_create_by( name: "Dastardly David",
  gender: "male",
  hair_color: "brown",
  eye_color: "blue",
  vehicle: "scooter",
  favorite_food: "Mexican" )
Suspect.find_or_create_by( name: "Edward Evil",
  gender: "male",
  hair_color: "white",
  eye_color: "hazel",
  vehicle: "white Jeep",
  favorite_food: "Pizza" )
Suspect.find_or_create_by( name: "Feckless Fran",
  gender: "female",
  hair_color: "black",
  eye_color: "brown",
  vehicle: "red sedan",
  favorite_food: "Pizza" )
Suspect.find_or_create_by( name: "Ghastly Gertrude",
  gender: "female",
  hair_color: "red",
  eye_color: "green",
  vehicle: "motorcycle",
  favorite_food: "Chinese" )
Suspect.find_or_create_by( name: "Irritating Ivan",
  gender: "male",
  hair_color: "black",
  eye_color: "blue",
  vehicle: "bicycle",
  favorite_food: "hot dogs" )
Suspect.find_or_create_by( name: "Jowly Janet",
  gender: "female",
  hair_color: "brown",
  eye_color: "green",
  vehicle: "truck",
  favorite_food: "hamburgers" )
Suspect.find_or_create_by( name: "Killer Kyle",
  gender: "male",
  hair_color: "blond",
  eye_color: "blue",
  vehicle: "sedan",
  favorite_food: "Italian" )
Suspect.find_or_create_by( name: "Dastardly David",
  gender: "male",
  hair_color: "brown",
  eye_color: "blue",
  vehicle: "black scooter",
  favorite_food: "Mexican" )
Suspect.find_or_create_by( name: "Lily-Livered Lily",
  gender: "female",
  hair_color: "white",
  eye_color: "green",
  vehicle: "motorcycle",
  favorite_food: "Chinese" )
Suspect.find_or_create_by( name: "Moody Monique",
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
