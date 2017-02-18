10000.times do
	Employee.create!(
		first_name: 				Faker::Name.first_name,
		last_name:  				Faker::Name.last_name,
		day_of_birth: 			Faker::Date.between(20.years.ago, 50.years.ago),
		place_of_birth: 		Faker::University.name,
		salary: 						rand(50000..500000) / 100,
		experience: 				rand(0..10),
		onsite: 						rand(2) == 1,
	)
end