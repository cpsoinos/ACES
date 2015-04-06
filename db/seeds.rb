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

reviews = ["Get there early. This joint is small and intimate, and if you don't get there early you'll get sat at the bar in the back by the kitchen doors.
            As far as ambiance goes, it's cozy. The food is good but not the best thing I ate while in Boston. If you're limited on time, this isn't the destination for you.
            I ate the Lobster Roll neet (roll and buttered lobster). My husband has some unmemorable dish.",
           "Come early or you'll end up waiting.
            Variety of oysters which make a great appetizer and fun, friendly service!
            Hot lobster roll is the way to go!
            Fish tacos were definitely something different and enjoyable.",
           "Our first trip to Boston as a family on our 8th grade son's Spring
           Break and we stopped in for some fresh seafood and they delivered!
           The oysters, Ipswich clams, arugula salad, North End Cioppino and
           Lobster Spaghettini were all delicious.  Highly recommend the food
           and the guys behind the counter/bar where we were seated provided
           good service!",
           "I came on a weekday so there was no wait! Ordered a glass of Chardonnay
           and a dozen oysters wellfleets, katama bay, kumamamoto, and kusshi.
           My favorites are kumamamotos and my new fav is the kusshi! So sweet
           and all the oysters super fresh that I had to get 6 more.",
           "We tried to eat here at around 8:30 on a Saturday night and were
           told it was a two hour wait, and that we couldn't wait, because the
           kitchen closes at 9:30. Closing is at 10:30. Soo...basically they told
           us to get lost because they wanted to close the kitchen prior to what
           they advertise as closing hours."]

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

description = ["They have some signature dishes like pumpkin tortellini
            and butternut squash ravioli that must be tried to be believed.",
           "My husband had the butternut squash ravioli and it was seriously
           the most amazing taste!",
           "I recommend the Cacio e Pepe pizza and the baked ricotta appetizer,
           hands down.",
           "We had the Cacio e pepe Pizza and a Margherita Pizza, they were delicious!",
           "The dining area was very clean and has a view into the open kitchen.",
           "I went with here with my wife for our anniversary
           and she loved it but i thought it was the worst place ever",
           "The yuzu kosho aioli rocked, and the squid ink was a powerful flavor,
           a great addition to the oyster.",
           "Our server was absolutely incredible and even gave us powdered-foie
           gras on the house.",
           "(Lucky 8) Foie Gras, balsamic chocolate kabayaki, raisin cocoa pulp,
           sip of aged sake.",
           "My favorite dish is the lobster roll -while a bit pricy,
           it is the best and I always get it",
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
