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

name = ['Del Taco',
    'Zaxbys',
    'Popeyes Louisiana Kitchen',
    'El Pollo Loco',
    'Chipotle Mexican Grill',
    'Little Caesars',
    'Papa Johns',
    'Dominos Pizza',
    'Steak n Shake',
    'Pizza Hut',
    'Dunkin Donuts',
    'Fatburger',
    'Long John Silvers',
    'Jamba Juice',
    'Quiznos',
    'Wendys',
    'Tim Hortons',
    'In-N-Out Burger',
    'Wingstop',
    'Dairy Queen']

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

25.times do
  Restaurant.create(name: "#{name.sample}", street_address: "#{street_address.sample}",
                    city: "#{city.sample}", state: "#{state.sample}",
                    zip_code: "#{zip_code.sample}", description: "#{description.sample}",
                    phone: '012-345-6789', reservations: r_and_d.sample, delivery: r_and_d.sample)
end
