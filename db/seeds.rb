#Seed Suspects (15)
Suspect.find_or_create_by( name: "Harrowing Harry", gender: "male", hair_color: "black", eye_color: "brown", vehicle: "motorcycle", favorite_food: "Russian" )
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
  vehicle: "convertible",
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
  tribeca = Neighborhood.find_or_create_by(name: "Tribeca")
  central_park = Neighborhood.find_or_create_by(name: "Central Park")
  times_square = Neighborhood.find_or_create_by(name: "Times Square")
  chelsea = Neighborhood.find_or_create_by(name: "Chelsea")
  union_square = Neighborhood.find_or_create_by(name: "Union Square")
  meatpacking = Neighborhood.find_or_create_by(name: "Meatpacking District")
  les = Neighborhood.find_or_create_by(name: "Lower East Side")
  soho = Neighborhood.find_or_create_by(name: "SoHo")
  uws = Neighborhood.find_or_create_by(name: "Upper West Side")
  west_village = Neighborhood.find_or_create_by(name: "West Village")


  #Seed Stores (3 per neighborhood)
  tribeca.stores << Store.find_or_create_by(name: "The Woolworth Building", witness: "Doorman")
  tribeca.stores << Store.find_or_create_by(name: "Shoe Repair Store", witness: "Cobbler")
  tribeca.stores << Store.find_or_create_by(name: "Coffee Shop", witness: "Barista")
  central_park.stores << Store.find_or_create_by(name: "Tavern on the Green", witness: "Maitre D'")
  central_park.stores << Store.find_or_create_by(name: "E 62nd St. Hot Dog Cart", witness: "Vendor")
  central_park.stores << Store.find_or_create_by(name: "Boat House", witness: "Boat Rental Clerk")
  times_square.stores << Store.find_or_create_by(name: "Times Square Plaza", witness: "Person in Elmo costume")
  times_square.stores << Store.find_or_create_by(name: "TKTS Booth", witness: "Ticket Seller")
  times_square.stores << Store.find_or_create_by(name: "Bubba Gump Shrimp Co.", witness: "Shrimp Purchaser")
  chelsea.stores << Store.find_or_create_by(name: "Chelsea Piers", witness: "Golf Trainer")
  chelsea.stores << Store.find_or_create_by(name: "Chelsea Market", witness: "Cashier")
  chelsea.stores << Store.find_or_create_by(name: "Chelsea Hotel", witness: "Front Desk Clerk")
  union_square.stores << Store.find_or_create_by(name: "Strand Book Store", witness: "English Major")
  union_square.stores << Store.find_or_create_by(name: "Union Square Greenmarket", witness: "Butcher")
  union_square.stores << Store.find_or_create_by(name: "Union Square Park", witness: "Performance Artist")
  meatpacking.stores << Store.find_or_create_by(name: "The High Line", witness: "Tourist")
  meatpacking.stores << Store.find_or_create_by(name: "Milk Studios", witness: "Photographer")
  meatpacking.stores << Store.find_or_create_by(name: "The Boom Boom Room", witness: "Bouncer")
  les.stores << Store.find_or_create_by(name: "Katz’s Delicatessen", witness: "Pastrami Slicer")
  les.stores << Store.find_or_create_by(name: "Sunshine Cinema", witness: "Ticket Taker")
  les.stores << Store.find_or_create_by(name: "Tenement Museum", witness: "Tour Guide")
  soho.stores << Store.find_or_create_by(name: "Tiffany & Co.", witness: "Breakfast Server")
  soho.stores << Store.find_or_create_by(name: "La Esquina", witness: "Waiter")
  soho.stores << Store.find_or_create_by(name: "Housing Works Bookstore", witness: "Stock Clerk")
  uws.stores << Store.find_or_create_by(name: "American Museum of Natural History", witness: "Animal Model Designer")
  uws.stores << Store.find_or_create_by(name: "Levain Bakery", witness: "Chocolate Chip Counter")
  uws.stores << Store.find_or_create_by(name: "Lincoln Center for the Performing Arts", witness: "Violinist")
  west_village.stores << Store.find_or_create_by(name: "Stonewall Inn", witness: "Bartender")
  west_village.stores << Store.find_or_create_by(name: "Village Vanguard", witness: "Booker")
  west_village.stores << Store.find_or_create_by(name: "IFC Center", witness: "Popcorn Maker")

  #Seed Clues (Maybe 10 per neighborhood)
  tribeca.clues << Clue.find_or_create_by(text: "I saw them near the Triangle Below Canal Street.")
  tribeca.clues << Clue.find_or_create_by(text: "I heard they were trying to get in to a famous film festival.")
  tribeca.clues << Clue.find_or_create_by(text: "I heard they were driving towards the Holland Tunnel.")
  tribeca.clues << Clue.find_or_create_by(text: "I heard they wanted to relax for while at Washington Market Park.")
  tribeca.clues << Clue.find_or_create_by(text: "They were seen strolling through BMCC.")
  tribeca.clues << Clue.find_or_create_by(text: "They were in an area where a lot of industrial buildings were turned into residential lofts.")
  tribeca.clues << Clue.find_or_create_by(text: "They were seen walking from Target to Whole Foods, which was just around the block.")
  tribeca.clues << Clue.find_or_create_by(text: "They were spotted playing mini golf by the river.")
  tribeca.clues << Clue.find_or_create_by(text: "Someone saw them getting off at the Chambers Street Subway Station.")
  tribeca.clues << Clue.find_or_create_by(text: "I think I saw them looking for the fire station where Ghostbusters was filmed.")

  central_park.clues << Clue.find_or_create_by(text: "I heard they wanted to rent a boat.")
  central_park.clues << Clue.find_or_create_by(text: "I heard they wanted to see the first official zoo in New York.")
  central_park.clues << Clue.find_or_create_by(text: "I heard they wanted to see the most visited urban park in the United States.")
  central_park.clues << Clue.find_or_create_by(text: "I heard they wanted to ride a carousel.")
  central_park.clues << Clue.find_or_create_by(text: "I heard they were looking for Rat Rock.")
  central_park.clues << Clue.find_or_create_by(text: "I heard they were looking for an Alice in Wonderland sculpture.")
  central_park.clues << Clue.find_or_create_by(text: "I heard they were looking for a meadow where sheep used to graze.")
  central_park.clues << Clue.find_or_create_by(text: "I saw them heading towards a castle whose name means 'beautiful view' in Italian.")
  central_park.clues << Clue.find_or_create_by(text: "They wanted to go to a mall that didn't have stores.")
  central_park.clues << Clue.find_or_create_by(text: "They wanted to see a place that is a swimming pool in the summer and a skating/hockey rink during the winter.")

  times_square.clues << Clue.find_or_create_by(text: "They wanted to get their picture taken with a super hero.")
  times_square.clues << Clue.find_or_create_by(text: "They wanted to see the world's second most visited tourist attraction.")
  times_square.clues << Clue.find_or_create_by(text: "They wanted to walk down one of the world's busiest pedestrian area.")
  times_square.clues << Clue.find_or_create_by(text: "I saw them heading towards an area named after a newspaper.")
  times_square.clues << Clue.find_or_create_by(text: "They were interested in the large crowd that gathered to celebrate Victory over Japan Day.")
  times_square.clues << Clue.find_or_create_by(text: "They wanted to see the brightest spot in the city.")
  times_square.clues << Clue.find_or_create_by(text: "They were interested in a glowing crystal ball on a flagpole.")
  times_square.clues << Clue.find_or_create_by(text: "They wanted to see if they could get tickets to Good Morning America.")
  times_square.clues << Clue.find_or_create_by(text: "They had a hankering for discounted show tickets.")
  times_square.clues << Clue.find_or_create_by(text: "They wanted to see the neighborhood where building owners are required to displayed illuminated signs via zoning ordinances.")

  chelsea.clues << Clue.find_or_create_by(text: "They wanted to see one of the centers of the city's art world.")
  chelsea.clues << Clue.find_or_create_by(text: "They were seen where the Empire Diner used to be.")
  chelsea.clues << Clue.find_or_create_by(text: "They wanted to see an Irish play.")
  chelsea.clues << Clue.find_or_create_by(text: "They wanted to see a museum dedicated to Himalayan art.")
  chelsea.clues << Clue.find_or_create_by(text: "They were asking questions about the New York Google office.")
  chelsea.clues << Clue.find_or_create_by(text: "They were wondering about the hotel where Sid Vicious committed his infamous murder.")
  chelsea.clues << Clue.find_or_create_by(text: "They were loitering in front of one of the world's largest apartment blocks when it opened in 1930.")
  chelsea.clues << Clue.find_or_create_by(text: "They were seen leaving the oldest episcopal seminary in nyc.")
  chelsea.clues << Clue.find_or_create_by(text: "They were asking about the Doughboy Statue.")
  chelsea.clues << Clue.find_or_create_by(text: "They were interested in the former site of Textile High School.")

  union_square.clues << Clue.find_or_create_by(text: "They wanted to see a statue of George Washington on a horse.")
  union_square.clues << Clue.find_or_create_by(text: "They love statues of Mahatma Gandhi.")
  union_square.clues << Clue.find_or_create_by(text: "They were looking for a large, year round Farmer's Market.")
  union_square.clues << Clue.find_or_create_by(text: "They were seen walking away from an iconic holiday market.")
  union_square.clues << Clue.find_or_create_by(text: "They wanted to challenge someone to a game of street chess.")
  union_square.clues << Clue.find_or_create_by(text: "They wanted to participate in a political demonstration.")
  union_square.clues << Clue.find_or_create_by(text: "They were seen walking away from the Hall associated with the infamous Boss Tweed.")
  union_square.clues << Clue.find_or_create_by(text: "They were searching for the former site of the old Rialto theatrical strip, New York City's first commercial theater district.")
  union_square.clues << Clue.find_or_create_by(text: "I heard they were snooping around a large LED clock that displays the time in 24-hour format.")
  union_square.clues << Clue.find_or_create_by(text: "I heard them asking questions about Donndorf statues in New York.")


  meatpacking.clues << Clue.find_or_create_by(text: "They are headed to the west side. That's all I know, I swear.")
  meatpacking.clues << Clue.find_or_create_by(text: "I saw a hotel keycard in their pocket. I can't remember exactly, but it was either the Gansevoort Hotel or the Standard High Line.")
  meatpacking.clues << Clue.find_or_create_by(text: "They recommended checking out The Whitney.")
  meatpacking.clues << Clue.find_or_create_by(text: "They mentioned a park on the railroad tracks. I'm not sure what that means.")
  meatpacking.clues << Clue.find_or_create_by(text: "It sounded like they are planning to hit up some clubs tonight.")
  meatpacking.clues << Clue.find_or_create_by(text: "They kept bragging about being selected for an upcoming photo shoot for the 'World's Hottest Criminals' calendar. Maybe take a look at Milk Studios.")
  meatpacking.clues << Clue.find_or_create_by(text: "I don't know what it meant, but I heard them say 'MePa' a couple of times. Very weird.")
  meatpacking.clues << Clue.find_or_create_by(text: "They casually stated that SoHo was too crowded, so they were planning on getting some designer duds somewhere else.")
  meatpacking.clues << Clue.find_or_create_by(text: "All I heard was something about cobblestone streets. I know it's not much, but I hope it helps catch the crook.")
  meatpacking.clues << Clue.find_or_create_by(text: "It looked like they were heading near the West Village and Chelsea.")

  les.clues << Clue.find_or_create_by(text: "It looked like they were heading to the east side.")
  les.clues << Clue.find_or_create_by(text: "They said that they wanted to get a pastrami sandwich like 'When Harry Met Sally'.")
  les.clues << Clue.find_or_create_by(text: "They talked about heading to Russ and Daughters for a bagel.")
  les.clues << Clue.find_or_create_by(text: "I think they are planning on seeing a show at the Mercury Lounge tonight.")
  les.clues << Clue.find_or_create_by(text: "They mentioned taking a tour at the Tenement Museum.")
  les.clues << Clue.find_or_create_by(text: "All I heard was something about the Williamsburg Bridge. Now scram, you're scaring away my customers.")
  les.clues << Clue.find_or_create_by(text: "They told my colleague that they were going to take a stroll at the East River Park.")
  les.clues << Clue.find_or_create_by(text: "They looked like the type to catch a show at Piano's or Arlene's Grocery.")
  les.clues << Clue.find_or_create_by(text: "They were talking about getting some brunch at the Clinton St. Baking Company.")
  les.clues << Clue.find_or_create_by(text: "They mentioned catching a movie at the Metrograph Theater.")

  soho.clues << Clue.find_or_create_by(text: "They mentioned heading south of Houston St.")
  soho.clues << Clue.find_or_create_by(text: "I think they are planning on spending some of their ill-gotten gains on a shopping spree.")
  soho.clues << Clue.find_or_create_by(text: "They said something about being downtown.")
  soho.clues << Clue.find_or_create_by(text: "I saw them get into a cab and asked to be taken to Spring and Broadway.")
  soho.clues << Clue.find_or_create_by(text: "They mentioned picking up a cronut. I hope that they don't steal them all!")
  soho.clues << Clue.find_or_create_by(text: "My buddy saw them popping into the original Dean and Deluca.")
  soho.clues << Clue.find_or_create_by(text: "It sounded like they were taking Broadway down to their next location.")
  soho.clues << Clue.find_or_create_by(text: "I would look downtown, probably just south of Greenwich Village.")
  soho.clues << Clue.find_or_create_by(text: "I don't know exactly where, but they mentioned the sidewalks being incredibly crowded at their next destination.")
  soho.clues << Clue.find_or_create_by(text: "I might've seen them when I had lunch at Balthazar today.")

  uws.clues << Clue.find_or_create_by(text: "I think they are going uptown.")
  uws.clues << Clue.find_or_create_by(text: "Word on the street is that they are hanging out on the west side.")
  uws.clues << Clue.find_or_create_by(text: "I think they had tickets for a show at the Beacon Theater.")
  uws.clues << Clue.find_or_create_by(text: "It sounded like they were listening to Opera music. Maybe take a look at the Metropolitan Opera.")
  uws.clues << Clue.find_or_create_by(text: "I didn't hear too much, but I think I overhead something about Columbus Circle.")
  uws.clues << Clue.find_or_create_by(text: "Their stomach kept grumbling and they mentioned going to get something to eat from the original Zabar's.")
  uws.clues << Clue.find_or_create_by(text: "They said something about learning dance at The Juilliard School. Maybe take a look around there.")
  uws.clues << Clue.find_or_create_by(text: "I would take a look at New York City Ballet. Those ballerinas always look like they are up to something. I don't trust them.")
  uws.clues << Clue.find_or_create_by(text: "If i had to guess where they were heading, I would take a look at the neighborhood above Hell's Kitchen. Just a hunch.")
  uws.clues << Clue.find_or_create_by(text: "They are planning on taking a bike ride in Riverside Park.")

  west_village.clues << Clue.find_or_create_by(text: "I think they are heading to Greenwich Village.")
  west_village.clues << Clue.find_or_create_by(text: "I heard something about them going downtown.")
  west_village.clues << Clue.find_or_create_by(text: "They kept talking about getting a burger at the Corner Bistro.")
  west_village.clues << Clue.find_or_create_by(text: "They were obsessed with the TV show 'Friends'. I think they were going to try and find the apartment building used for the show.")
  west_village.clues << Clue.find_or_create_by(text: "It sounded like they might go play a couple games of pool at Fat Cat.")
  west_village.clues << Clue.find_or_create_by(text: "They mentioned getting some fresh air on the Hudson.")
  west_village.clues << Clue.find_or_create_by(text: "I heard them say that the best slice is at Joe's.")
  west_village.clues << Clue.find_or_create_by(text: "They said something about SATC, and needing a cupcake.")
  west_village.clues << Clue.find_or_create_by(text: "They let it slip that they are going to see the site of the Stonewall riots.")
  west_village.clues << Clue.find_or_create_by(text: "I think they were going to the 2nd oldest bar in the city, The Ear Inn.")

  Clue.find_or_create_by(text: "I haven't seen anyone. Now leave me alone.")
  Clue.find_or_create_by(text: "Sorry, I don't know anything about that.")
  Clue.find_or_create_by(text: "That's an interesting story, but I don't have any info for you.")
