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
  vehicle: "truck",
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
  vehicle: "truck",
  favorite_food: "Mexican" )
Suspect.find_or_create_by( name: "Edward Evil",
  gender: "male",
  hair_color: "white",
  eye_color: "hazel",
  vehicle: "motorcycle",
  favorite_food: "pizza" )
Suspect.find_or_create_by( name: "Feckless Fran",
  gender: "female",
  hair_color: "black",
  eye_color: "brown",
  vehicle: "limousine",
  favorite_food: "pizza" )
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
  vehicle: "limousine",
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
  vehicle: "convertible"
  favorite_food: "Italian" )
Suspect.find_or_create_by( name: "Dastardly David",
  gender: "male",
  hair_color: "brown",
  eye_color: "blue",
  vehicle: "skateboard",
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
  vehicle: "skateboard",
  favorite_food: "Italian" )
Suspect.find_or_create_by( name: "Carmen Sandiego",
  gender: "female",
  hair_color: "brown",
  eye_color: "brown",
  vehicle: "convertible",
  favorite_food: "Mexican" )

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
  tribeca.clues << Clue.create(text: "I saw them near the Triangle Below Canal Street.")
  tribeca.clues << Clue.create(text: "I heard they were trying to get in to a famous film festival.")
  tribeca.clues << Clue.create(text: "I heard they were driving towards the Holland Tunnel.")
  tribeca.clues << Clue.create(text: "I heard they wanted to relax for while at Washington Market Park.")
  tribeca.clues << Clue.create(text: "They were seen strolling through BMCC.")
  tribeca.clues << Clue.create(text: "They were in an area where a lot of industrial buildings were turned into residential lofts.")
  tribeca.clues << Clue.create(text: "They were seen walking from Target to Whole Foods, which was just around the block.")
  tribeca.clues << Clue.create(text: "They were spotted playing mini golf by the river.")
  tribeca.clues << Clue.create(text: "Someone saw them getting off at the Chambers Street Subway Station.")
  tribeca.clues << Clue.create(text: "I think I saw them looking for the fire station where Ghostbusters was filmed.")

  central_park.clues << Clue.create(text: "I heard they wanted to rent a boat.")
  central_park.clues << Clue.create(text: "I heard they wanted to see the first official zoo in New York.")
  central_park.clues << Clue.create(text: "I heard they wanted to see the most visited urban park in the United States.")
  central_park.clues << Clue.create(text: "I heard they wanted to ride a carousel.")
  central_park.clues << Clue.create(text: "I heard they were looking for Rat Rock.")
  central_park.clues << Clue.create(text: "I heard they were looking for an Alice in Wonderland sculpture.")
  central_park.clues << Clue.create(text: "I heard they were looking for a meadow where sheep used to graze.")
  central_park.clues << Clue.create(text: "I saw them heading towards a castle whose name means 'beautiful view' in Italian.")
  central_park.clues << Clue.create(text: "They wanted to go to a mall that didn't have stores.")
  central_park.clues << Clue.create(text: "They wanted to see a place that is a swimming pool in the summer and a skating/hockey rink during the winter.")

  times_square.clues << Clue.create(text: "They wanted to get their picture taken with a super hero.")
  times_square.clues << Clue.create(text: "They wanted to see the world's second most visited tourist attraction.")
  times_square.clues << Clue.create(text: "They wanted to walk down one of the world's busiest pedestrian area.")
  times_square.clues << Clue.create(text: "I saw them heading towards an area named after a newspaper.")
  times_square.clues << Clue.create(text: "They were interested in the large crowd that gathered to celebrate Victory over Japan Day.")
  times_square.clues << Clue.create(text: "They wanted to see the brightest spot in the city.")
  times_square.clues << Clue.create(text: "They were interested in a glowing crystal ball on a flagpole.")
  times_square.clues << Clue.create(text: "They wanted to see if they could get tickets to Good Morning America.")
  times_square.clues << Clue.create(text: "They had a hankering for discounted show tickets.")
  times_square.clues << Clue.create(text: "They wanted to see the neighborhood where building owners are required to displayed illuminated signs via zoning ordinances.")
