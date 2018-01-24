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
  les << Store.create(name: "Katz\’s Delicatessen", witness: "Pastrami Slicer")
  les << Store.create(name: "Sunshine Cinema", witness: "Ticket Taker")
  les << Store.create(name: "Tenement Museum", witness: "Tour Guide")
  soho << Store.create(name: "Tiffany & Co.", witness: "Breakfast Server")
  soho << Store.create(name: "La Esquina", witness: "Waiter")
  soho << Store.create(name: "Housing Works Bookstore", witness: "Stock Clerk")
  uws << Store.create(name: "American Museum of Natural History", witness: "Animal Model Desigener")
  uws << Store.create(name: "Levain Bakery", witness: "Chocolate Chip Counter")
  uws << Store.create(name: "Lincoln Center for the Performing Arts", witness: "Violinist")
  west_village << Store.create(name: "Stonewall Inn", witness: "Bartender")
  west_village << Store.create(name: "Village Vanguard", witness: "Booker")
  west_village << Store.create(name: "IFC Center", witness: "Popcorn Maker")

  #Seed Clues (Maybe 10 per neighborhood)
  tribeca.clues << Clue.create(text: "The is a really useful clue.")


  uws.clues << Clue.create(text: "I think they are going uptown.")
  uws.clues << Clue.create(text: "Word on the street is that they are hanging out on the west side.")
  uws.clues << Clue.create(text: "I think they had tickets for a show at the Beacon Theater.")
  uws.clues << Clue.create(text: "It sounded like they were listening to Opera music. Maybe take a look at the Metropolitan Opera.")
  uws.clues << Clue.create(text: "I didn\'t hear too much, but I think I overhead Columbus Circle.")
  uws.clues << Clue.create(text: "Their stomach kept grumbling and they mentioned something from the original Zabar\'s.")
  uws.clues << Clue.create(text: "")
  uws.clues << Clue.create(text: "")
  uws.clues << Clue.create(text: "")
  uws.clues << Clue.create(text: "")
  west_village.clues << Clue.create(text: "I think they were heading to the west side of Greenwich Village.")
  west_village.clues << Clue.create(text: "I heard something about them going downtown.")
  west_village.clues << Clue.create(text: "They kept talking about getting a burger at the Corner Bistro.")
  west_village.clues << Clue.create(text: "They were obsessed with the TV show \'Friends\'. I think they were going to try and find the apartment building used for the show.")
  west_village.clues << Clue.create(text: "It sounded like they might go play a couple games of pool at Fat Cat.")
  west_village.clues << Clue.create(text: "They mentioned getting some fresh air on the Hudson.")
  west_village.clues << Clue.create(text: "I heard them say that the best slice is at Joe's.")
  west_village.clues << Clue.create(text: "They said something about SATC, and needing a cupcake.")
  west_village.clues << Clue.create(text: "They kept telling me that I had to check out Murray's Cheese.")
  west_village.clues << Clue.create(text: "I think they were going to the 2nd oldest bar in the city, The Ear Inn.")
