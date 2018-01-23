#Seed Suspects (15)
Suspect.create( name: "Harrowing Harry",
  gender: "Male",
  hair_color: "Black",
  eye_color: "Brown",
  vehicle: "Motorcycle",
  favorite_food: "Russian" )

  #Seed Neighborhoods (Look up list)
  tribeca = Neighborhood.create(name: "Tribeca")
  central_park = Neighborhood.create(name: "Central Park")
  times_square = Neighborhood.create(name: "Times Square")
  chelsea = Neighborhood.create(name: "Chelsea")
  union_square = Neighborhood.create(name: "Union Square")
  meatpacking = Neighborhood.create(name: "Meatpacking")
  les = Neighborhood.create(name: "Lower East Side")
  soho = Neighborhood.create(name: "SoHo")
  uws = Neighborhood.create(name: "Upper West Side")
  west_village = Neighborhood.create(name: "West Village")


  #Seed Stores (3 per neighborhood)
  tribeca.stores << Store.create(name: "The Woolworth Building", witness: "Doorman")
  tribeca.stores << Store.create(name: "Shoe Repair Store", witness: "Cobbler")
  tribeca.stores << Store.create(name: "Coffee Shop", witness: "Barista")
  central_park << Store.create(name: "Tavern on the Green", witness: "Maitre D'")
  central_park << Store.create(name: "E 62nd St. Hot Dog Cart", witness: "Vendor")
  central_park << Store.create(name: "Boat House", witness: "Boat Rental Clerk")
  times_square << Store.create(name: "Times Square Plaza", witness: "Person in Elmo costume")
  times_square << Store.create(name: "TKTS Booth", witness: "Ticket Seller")
  times_square << Store.create(name: "Bubba Gump Shrimp Co.", witness: "Shrimp Purchaser")
  chelsea << Store.create(name: "Chelsea Piers", witness: "Golf Trainer")
  chelsea << Store.create(name: "Chelsea Market", witness: "Cashier")
  chelsea << Store.create(name: "Chelsea Hotel", witness: "Front Desk Clerk")
  union_square << Store.create(name: "Strand Book Store", witness: "English Major")
  union_square << Store.create(name: "Union Square Greenmarket", witness: "Butcher")
  union_square << Store.create(name: "Union Square Park", witness: "Performance Artist")
  meatpacking << Store.create(name: "The High Line", witness: "Tourist")
  meatpacking << Store.create(name: "Milk Studios", witness: "Photographer")
  meatpacking << Store.create(name: "The Boom Boom Room", witness: "Bouncer")

  #Seed Clues (Maybe 10 per neighborhood)
  tribeca.clues << Clue.create(text: "The is a really useful clue.")
