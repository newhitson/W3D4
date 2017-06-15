# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Poll.destroy_all
AnswerChoice.destroy_all
Response.destroy_all
Question.destroy_all


user1 = User.create!(user_name: 'Raynor')
user2 = User.create!(user_name: 'Sylvanas')

poll1 = Poll.create!(user_id: user1.id, title: 'Zerg')

question1 = Question.create!(poll_id: poll1.id, question: 'Is that a baneling!?')
question2 = Question.create!(poll_id: poll1.id, question: 'Where is Kerrigan?')

answerchoice1 = AnswerChoice.create!(question_id: question1.id, answer_text: 'No.')
answerchoice2 = AnswerChoice.create!(question_id: question1.id, answer_text: 'Run away!')
answerchoice3 = AnswerChoice.create!(question_id: question2.id, answer_text: 'In the Hive')
answerchoice4 = AnswerChoice.create!(question_id: question2.id, answer_text: 'Aueir')

response1 = Response.create!(user_id: user2.id, answer_choice_id: answerchoice2.id)
response2 = Response.create!(user_id: user2.id, answer_choice_id: answerchoice4.id)
