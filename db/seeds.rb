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
Category.create!(name: "Full Stack Dev")
Category.create!(name: "Web Development")

Location.create!(location: "014.09.015")
Location.create!(location: "080.02.002")
Location.create!(location: "012.11.022")
Location.create!(location: "008.11.068")

jasmine.courses.create!(name:           "Web Database Applications", 
                        prerequisite:   "Web Programming", 
                        description:    "This course provide an in-depth look industry-relevant topics such as Laravel Framework (Object-Oriented MVC); Node.js, Express,js and NoSQL (MongoDB) while focussing on Open-source Web development stack.", 
                        category_ids:   [3, 4],
                        location_ids:   [2, 3])

jasmine.courses.create!(name:           "Rapid Application Development", 
                        prerequisite:   "Web Programming", 
                        description:    "Rapid application development provides a range of enabling skills for independent development of complete and industry standard software applications.  These skills will equip students to be ready for commercial development and to meet the demand of clients of various sizes, especially startups.", 
                        picture: Rails.root.join("db/images/rad.png").open,
                        category_ids:   [4],
                        location_ids:   [1, 4])
                                
steven.courses.create!(name:            "iPhone Software Engineering", 
                       prerequisite:    "Programming Techniques",
                       description:     "iPhone Software Engineering is concerned with the development of applications on the Apple iPhone and iPod Touch platforms. Current SWIFT and the Apple iOS SDK will be used as a basis for teaching programming techniques and design patterns related to the development of standalone applications and mobile portals to enterprise and m-commerce systems.",
                       category_ids:    [1],
                       location_ids:    [1, 2])
                       
steven.courses.create!(name:            "Programming Project 1", 
                       prerequisite:    "Software Engineering Project Management",
                       description:     "This course is designed to provide you with hands-on practical experience developing software and/or delivering IT solutions in a project environment. You will work in teams and complete projects from inception to implementation.",
                       category_ids:    [3],
                       location_ids:    [1, 2])
                       
steven.courses.create!(name:            "Cloud Computing", 
                       prerequisite:    "Web Programming",
                       description:     "This course covers topics and technologies related to Cloud Computing and their practical implementations. You should explore different architectural models of cloud computing, the concepts of virtualisation and cloud orchestration. You should gain hands-on experience with various features of popular cloud platforms such as Google App Engine, IBM Bluemix and Amazon Web Services.",
                       picture: Rails.root.join("db/images/cloud.jpg").open,
                       category_ids:    [4],
                       location_ids:    [2, 4])
                       
# Admin
Admin.create!(username: "admin", password: "password", password_confirmation: "password")
