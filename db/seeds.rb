User.create(email: "a@a.com",name: "The Poodle" , password: "1234", password_confirmation: "1234")
User.create(email: "poodle@gmail.com", name: "George Poodle", password: "1234", password_confirmation: "1234")
User.create(email: "gopher@pain.com", name: "Some Poodle", password: "1234", password_confirmation: "1234")

Survey.create(user_id: 1, title: "Animals",is_public: true, category: "Customer Satisfaction")
Question.create(survey_id: 1, variety: "text", prompt: "Favorite Snail?")
Question.create(survey_id: 1, variety: "text", prompt: "Favorite Mammal?")
Question.create(survey_id: 1, variety: "multi", prompt: "Favorite Snake?")
Question.create(survey_id: 1, variety: "text", prompt: "Favorite Frog?")
Question.create(survey_id: 1, variety: "text", prompt: "Favorite Peligoose?")

Survey.create(user_id: 1, title: "Meal Times",is_public: false,  category: "Product")
Question.create(survey_id: 2, variety: "text", prompt: "When do you eat dinner?")
Question.create(survey_id: 2, variety: "text", prompt: "Why do you eat lunch?")
Question.create(survey_id: 2, variety: "multi", prompt: "Lunch or Supper?")
Question.create(survey_id: 2, variety: "text", prompt: "When is Brunch?")
Question.create(survey_id: 2, variety: "text", prompt: "What is your problem?")

Survey.create(user_id: 1, title: "TV Shows", is_public: true, category: "Course")
Question.create(survey_id: 3, variety: "text", prompt: "Favorite TV Character?")
Question.create(survey_id: 3, variety: "text", prompt: "Community or Cougar Town?")
Question.create(survey_id: 3, variety: "text", prompt: "Most Hated TV Show?")
Question.create(survey_id: 3, variety: "text", prompt: "If you could kill one TV character, who would it be?")
Question.create(survey_id: 3, variety: "text", prompt: "Show you can't live without?")


Survey.create(user_id: 2, title: "Alex-Questions", is_public: true, category: "Political")
Question.create(survey_id: 4, variety: "text", prompt: "Your View On Alex's Beard:")
Question.create(survey_id: 4, variety: "text", prompt: "Where should Alex go?")
Question.create(survey_id: 4, variety: "text", prompt: "What is your least favorite thing Alex does?")

Survey.create(user_id: 3, title: "DBC", is_public: true, category: "Other")
Question.create(survey_id: 5, variety: "text", prompt: "What free food should be offered?")
Question.create(survey_id: 5, variety: "multi", prompt: "Favorite Cohort")
Question.create(survey_id: 5, variety: "text", prompt: "Scariest Stuffed Animal")
Question.create(survey_id: 5, variety: "multi", prompt: "Is the Yoga Room Hot?")
Question.create(survey_id: 5, variety: "text", prompt: "Where is the beef?")


Option.create(question_id: 3, content: "Alex's Snake")
Option.create(question_id: 3, content: "Some Other Lame Snake")

Option.create(question_id: 8, content: "Lunch")
Option.create(question_id: 8, content: "Supper")

Option.create(question_id: 20, content: "Foxes")
Option.create(question_id: 20, content: "Otters")
Option.create(question_id: 20, content: "Squzerals")
Option.create(question_id: 20, content: "Other Lame Cohort")

Option.create(question_id: 22, content: "No it is A freezing Ice Palace")
Option.create(question_id: 22, content: "Hotter than the fires of 100 Super Novas")

User.create(email: "alex@poodle.com",name: "Alex Codreanu" , password: "123456", password_confirmation: "123456")
Survey.create(user_id: 4, title: "Poodle survey", is_public: true, category: "Other")
Question.create(survey_id: 6, variety: "multi", prompt: "What do you think about this web app?")
Option.create(question_id: 24, content: "This app is awesome!!!")
Option.create(question_id: 24, content: "It's ok!!!")
Option.create(question_id: 24, content: "It sucks!!!")
Question.create(survey_id: 6, variety: "text", prompt: "Please leave us more feedback:")
