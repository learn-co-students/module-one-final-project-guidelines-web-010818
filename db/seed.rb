#Seed Suspects (15)
Suspect.create( name: "Harrowing Harry",
  gender: "Male",
  hair_color: "Black",
  eye_color: "Brown",
  vehicle: "Motorcycle",
  favorite_food: "Russian" )

  #Seed Neighborhoods (Look up list)
  tribeca = Neighborhood.create(name: "Tribeca")

  #Seed Stores (3 per neighborhood)
  tribeca.stores << Store.create(name: "Bodega", witness: "clerk")
  # tribeca.store = Store.create(name: "Bodega", witness: "clerk")
  # tribeca.store = Store.create(name: "Bodega", witness: "clerk")

  #Seed Clues (Maybe 10 per neighborhood)
  tribeca.clues << Clue.create(text: "The is a really useful clue.")
