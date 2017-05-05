# Coordinator Jasmine
jasmine = User.create!(name:                  "Jasmine Ellis",
                       email:                 "jasmine.ellis@rmit.edu.au",
                       password:              "Foobar1!",
                       password_confirmation: "Foobar1!")
                       
# Coordinator Steven                      
steven = User.create!(name:                   "Steven Xu",
                       email:                 "steven.xu@rmit.edu.au",
                       password:              "Foobar1!",
                       password_confirmation: "Foobar1!")
                       
Category.create!(name: "iOS Engineering")
Category.create!(name: "Java")
Category.create!(name: "Full Stack Web Dev")
Category.create!(name: "Web Development")

Location.create!(location: "014.09.031")
Location.create!(location: "080.02.002")
Location.create!(location: "012.11.022")
                       
