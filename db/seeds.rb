city = %w[Poquott
Comstock
Northwest
Bisbee
Willcox
Preston
Nitro
Sarcoxie
Wattsburg
Deep Water
Saegertown
Boston
Antigo
Frierson
Venersborg
Sunview
Prestonsburg
Menands
Ettrick
NYC
Waban
Worcester
Purvis]

name = [
  "Molly Ward Gardens",
  "Cambridge House",
  "Georgian",
  "Stonehouse Restaurant",
  "Cafe Song Inc",
  "Seasons Bistro & Grille",
  "Zipper Factory Tavern",
  "Bread's Arisin'",
  "Chai Peking Chinese Restaurant",
  "Heartline Cafe",
  "Grants Restaurant & Bar",
  "Pistone's Italian Inn",
  "Pentimento",
  "Paddy O'Brian's",
  "Paulette's",
  "Appalachia American Grill",
  "Clery's Bar & Restaurant",
  "Bistros Gourmet Deli & Pizza",
  "Mac Gregor's Grill & Tap Room",
  "J P China",
  "Nick N Willy's Pizza",
  "Joe Morley's Smoked Beef",
  "Mr Jim's Pizza",
  "Colonial Steak House",
  "Harbor Lights",
  "Patio Restaurants",
  "PO-PO Family Restaurant",
  "Coogans",
  "Monticello Restaurant",
  "Cozymel's Mexican Grill",
  "Laudisio Ristorante Italiano",
  "Frontroom Pizza",
  "City Dock Cafe",
  "Food 101 At Highlands Llc",
  "Shiki Japanese Restaurant",
  "World Famous Heartland Grill",
  "Taco John's",
  "Pub House",
  "Toozypatza Pizza",
  "Alley Cantina",
  "Tony Z's Italian Restaurante",
  "Franklin's Tower",
  "LA Cocina Mexicana",
  "Hickory Tavern",
  "Crescent City",
  "Raoul's Velvet Room",
  "Wahpeton Deli",
  "Thai Pilin Restaurant",
  "Lolita Restaurant",
  "Old Angler's Inn"
]

street_address = ['Broad Street',
    'Lake Street',
    'Hillside Drive',
    'Route 202',
    'Wall Street',
    '3rd Street',
    'Oxford Court',
    '10th Street',
    'Laurel Street',
    'Olive Street',
    '4th Avenue',
    'Church Street South',
    'Route 32',
    'Sunset Drive',
    'Lincoln Avenue',
    'State Street',
    'Hawthorne Lane',
    'Locust Lane']

state = %w[
Alabama
Alaska
Arizona
Arkansas
California
Colorado
Connecticut
Delaware
Florida
Georgia
Hawaii
Idaho
Illinois
Indiana
Iowa
Kansas
Kentucky
Louisiana
Maine
Maryland
Massachusetts
Michigan
Minnesota
Mississippi
Missouri
Montana
Nebraska
Nevada
New Hampshire
New Jersey
New Mexico
New York
North Carolina
North Dakota
Ohio
Oklahoma
Oregon
Pennsylvania
Rhode Island
South Carolina
South Dakota
Tennessee
Texas
Utah
Vermont
Virginia
Washington
West Virginia
Wisconsin
Wyoming
]

description = ['Italian fine dining',
               'Oldest established pizza place',
               '24 hour burger joint',
               'Oyster house',
               'American bar & grill']

r_and_d = [true, false]

zip_code = %w[86704
48888
12674
79394
19860
64350
39193
43777
52376
68211
44764
64304
36353
41204
31701
26684
44040
01744
69863
82543]

reviews = ["i love this place",
           "this place has terrible food",
           "i only go here on tuesdays",
           "great, now i have food poisoning",
           "dont eat the chicken",
           "i went with here with my wife for our anniversary
           and she loved it but i thought it was the worst place ever",
           "please tell me how to get back to this place!",
           "there's alot of the same reviews on this page",
           "dunkin donuts is probably my favourite place but im not
           too sure",
           "theres always a strange smell at this place, but i kind
           of like it",
           "I bring my chihuahua here and she likes the steak tartar
           the most, but personally i think its disgusting"]

ratings = [1, 2, 3, 4, 5]

50.times do
  Restaurant.find_or_create_by!(
    name: "#{name.sample}", street_address: "#{street_address.sample}",
    city: "#{city.sample}", state: "#{state.sample}",
    zip_code: "#{zip_code.sample}", description: "#{description.sample}",
    phone: '012-345-6789', reservations: r_and_d.sample, delivery: r_and_d.sample
    )
end

user = User.new(email: "seed@seeder.com", password: "seedpassword")
user.save!

Restaurant.all.each do |restaurant|
  10.times do
    restaurant.reviews.create(
      body: "#{reviews.sample.capitalize}",
      rating: ratings.sample, user_id: 1
      )
  end
end
