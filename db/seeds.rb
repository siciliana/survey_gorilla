20.times do
  User.create(username: Faker::Name.name, password: "123")
end

20.times do
  random_string = (0...8).map { (65 + rand(26)).chr }.join
  User.find(rand(1..20)).surveys << Survey.create(title: Faker::Lorem.words(num = 3, supplemental = false).join(" "), url: random_string)
end

50.times do
  Survey.find(rand(1..20)).questions << Question.create(q_title: Faker::Lorem.words(num = 4, supplemental = false), q_type: "text")
end

50.times do
  submissions = Survey.find(rand(1..20)).submissions << Submission.create(user_id: rand(1..20))
  survey = Survey.find(submissions.last.survey_id)
  survey.questions.each do |question|
    Response.create(submission_id: submissions.last.id, question_id: question.id, user_input: Faker::Lorem.words(num = 3, supplemental = false).join(" "))
  end
end
