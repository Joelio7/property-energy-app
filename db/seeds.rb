# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Property.create({property_area: 'Cloverfield', property_type: 'house', year_built: rand(30.years).seconds.ago, energy_type: 'solar', property_value: 500000, photo_url: 'https://images.unsplash.com/photo-1430285561322-7808604715df?ixlib=rb-1.2.1&auto=format&fit=crop&w=200&h=133&q=80'})
Property.create({property_area: 'San Clarita', property_type: 'condo', year_built: rand(20.years).seconds.ago, energy_type: 'electric', property_value: 234000, photo_url: 'https://images.unsplash.com/photo-1538323684039-4f8ac9fdaacb?ixlib=rb-1.2.1&auto=format&fit=crop&w=200&h=133&q=80'})
Property.create({property_area: 'Georgetown',  property_type: 'apartment', year_built: rand(5.years).seconds.ago, energy_type: 'gas', property_value: 100000, photo_url: 'https://images.unsplash.com/photo-1505819244306-ef53954f9648?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=200&h=133&q=80' })
Property.create({property_area: 'Horse Lake', property_type: 'house', year_built: rand(30.years).seconds.ago, energy_type: 'solar', property_value: 500000, photo_url:'https://images.unsplash.com/photo-1510798831971-661eb04b3739?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=200&h=133&q=80'})
Property.create({property_area: 'North Austin', property_type: 'condo', year_built: rand(20.years).seconds.ago, energy_type: 'electric', property_value: 234000, photo_url: 'https://images.unsplash.com/photo-1504615755583-2916b52192a3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=200&h=133&q=80'})
Property.create({property_area: 'Salem',  property_type: 'apartment', year_built: rand(5.years).seconds.ago, energy_type: 'gas', property_value: 10000, photo_url: 'https://images.unsplash.com/photo-1483068919052-4ade7bdc0edb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=200&h=133&q=80'})
Property.create({property_area: 'Watermark', property_type: 'condo', year_built: rand(20.years).seconds.ago, energy_type: 'electric', property_value: 237000, photo_url: 'https://images.unsplash.com/photo-1462759353907-b2ea5ebd72e7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=200&h=133&q=80'})
Property.create({property_area: 'Silverdale',  property_type: 'apartment', year_built: rand(5.years).seconds.ago, energy_type: 'gas', property_value: 150000, photo_url: 'https://images.unsplash.com/photo-1414353220870-38cc1d0fbf76?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=200&h=133&q=80'})


100.times {EnergyRecording.create({time_recorded: rand(1.years).seconds.ago, units: rand(100..1000), property_id: rand(1..8)})}