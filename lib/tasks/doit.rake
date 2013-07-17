require 'ffaker'
namespace :doit do
  task now: :environment do

    count = 10000
    1000.times do |i|

      f = Family.create name: Faker::Name.last_name
      f.primay_address = Address.new( {
        line_1: Faker::Address.street_address,
        line_2: Faker::Address.secondary_address,
        city:   Faker::Address.city,
        state:  Faker::Address.us_state,
        zip:    Faker::Address.zip_code
      })

      f.save
      puts f.name

      (rand(10) + 1).times do |x|
        case_file = CaseFile.new({
          name:    Faker::Company.name,
          number:  count += 1,
          comment: Faker::Lorem.paragraph,
          date:    rand(100).days.ago
        })

        f.case_files << case_file
        f.save

      end

      (rand(5) + 1).times do |x|
        p = Person.new ( {
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            ssn: (0..3).map{ rand(9).to_s}.join.to_i
          }
        )
        rand(3).times do
          p.addresses << Address.new( {
            line_1: Faker::Address.street_address,
            line_2: Faker::Address.secondary_address,
            city:   Faker::Address.city,
            state:  Faker::Address.us_state,
            zip:    Faker::Address.zip_code
          })
        end

        puts p.to_s
        f.people << p
        f.save
      end

    end

  end
end
