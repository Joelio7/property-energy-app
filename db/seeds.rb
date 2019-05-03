# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Property.create({property_type: 'house', year_built: 186710400, energy_type: 'solar', property_value: 500000})
Property.create({property_type: 'condo', year_built: 1272672000, energy_type: 'electric', property_value: 234000})
Property.create({property_type: 'apartment', year_built: 1425427200, energy_type: 'gas', property_value: 100000})

50.times {EnergyRecording.create({time_recorded: rand(2.years).seconds.ago, units: rand(100..1000), property_id: rand(1..3)})}