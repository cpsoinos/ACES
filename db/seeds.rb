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

r_and_d = [true, false]

user = User.new(name: "admin", email: "sd@seeder.com", password: "seedpassword")
user.save!

client = Yelp::Client.new({ consumer_key: ENV['CONSUMER_KEY'],
                            consumer_secret: ENV['CONSUMER_SECRET'],
                            token: ENV['TOKEN'],
                            token_secret: ENV['TOKEN_SECRET']
                          })


result = client.search('chinatown, ma' , { term: 'chinese' })
result = JSON.parse(result.to_json)
business_info = result['businesses']
business_info.each do |business|
  puts business['name']
  Restaurant.find_or_create_by!(
    name: "#{business['name']}", street_address: "#{business["location"]['address'][0]}",
    city: "#{business["location"]['city']}", state: "Massachusetts",
    zip_code: "#{business["location"]['postal_code']}", description: "#{business["snippet_text"]}",
    phone: "#{business["display_phone"]}", reservations: r_and_d.sample, delivery: r_and_d.sample,
    photo: "#{business["image_url"]}"
  )
end
