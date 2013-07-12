require 'ffaker'
namespace :doit do
  task now: :environment do

    100.times do |i|

      f = Family.create name: Faker::Name.last_name
      f.primay_address = Address.new( {
        line_1: Faker::Address.street_address,
        line_2: Faker::Address.secondary_address,
        city:   Faker::Address.city,
        state:  Faker::Address.us_state,
        zip:    Faker::Address.zip_code
      }
                                      )
      f.save
      puts 'hi'

      5.times do |x|
        p = Person.new ( {
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            ssn: rand(4)
          }
        )

        f.people << p
        f.save
      end

    end

  end
end
