["Asia", "Schengen", "Worldwide"].each do |dest_class|
  DestinationClass.find_or_create_by(name: dest_class)
end

[4, 7, 10, 15, 21, 30, 60, 90, 180, 365].each do |travel_day|
  TravelPeriod.find_or_create_by(days: travel_day)
end

["Individual", "Family", "Group"].each do |traveller_type|
  TravellerType.find_or_create_by(name: traveller_type)
end

["Medical & Emergency Expenses", "Travel Inconveniences", "Personal Belongings & Baggage", "Other Services", "Add-ons"].each do |benefit_category|
  BenefitCategory.find_or_create_by(name: benefit_category, from: Date.today)
end

TravelPrem.import("./db/uploads/Travel Premiums.xlsx")
Benefit.import("./db/uploads/FGIC Enhanced Travel.xlsx")

json = ActiveSupport::JSON.decode(File.read('db/uploads/countries.json'))

json.each do |country|

  dci = case country['name']['common']
  when
    "Austria",
    "Belgium",
    "Czechia",
    "Denmark",
    "Estonia",
    "Finland",
    "France",
    "Germany",
    "Greece",
    "Hungary",
    "Iceland",
    "Italy",
    "Latvia",
    "Lithuania",
    "Luxembourg",
    "Malta",
    "Netherlands",
    "Norway",
    "Poland",
    "Portugal",
    "Slovakia",
    "Slovenia",
    "Spain",
    "Sweden",
    "Switzerland",
    "Liechtenstein"
    then 2 # Schengen countries - 26
  when
    "Bahrain",
    "Cyprus",
    "Egypt",
    "Iran",
    "Iraq",
    "Israel",
    "Jordan",
    "Kuwait",
    "Lebanon",
    "Oman",
    "Qatar",
    "Saudi Arabia",
    "Syria",
    "Turkey",
    "United Arab Emirates",
    "Yemen"
    then 3 # Middle East countries - 16; classed as Worldwide though located in Asia
  when "Japan" then 3 # classed as Worldwide though located in Asia
  else
    if country['region'] == "Asia"
      1
    else
      3
    end
  end

  Country.find_or_create_by(
    name: country['name']['common'],
    shortname: country['cca2'],
    shortname2: country['cca3'],
    capital: country['capital'],
    region: country['region'],
    subregion: country['subregion'],
    destination_class_id: dci
    )

end

["superadmin", "admin", "moderator","customer"].each do |role|
  Role.find_or_create_by(name: role)
end

User.create!(username: "chrism", email: "cymarquez@fgic.com.ph", password: "chrism")
Profile.create!(user_id: 1, first_name: "Chris", last_name: "Marquez")
User.first.roles << Role.where(name: 'superadmin')

User.create!(username: "raynan", email: "raynan@raynan.com", password: "raynan")
Profile.create!(user_id: 2, first_name: "Raynan", last_name: "Tamayo")
User.second.roles << Role.where(name: 'customer')
