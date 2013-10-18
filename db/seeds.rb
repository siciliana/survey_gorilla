20.times do
  User.create(username: Faker::Name.name, password: "123")
end

50.times do
  random_string = (0...8).map { (65 + rand(26)).chr }.join
  User.find(rand(1..20)).surveys << Survey.create(title: Faker::Lorem.words(num = 3, supplemental = false).join(" "), url: random_string)
end

10.times do
  Survey.find(rand(1..10)).questions << Question.create(q_title: Faker::Lorem.words(num = 4, supplemental = false), q_type: ["text", "multichoice"].sample)
end

1.upto(10) do |i|
  Survey.find(i).questions.each do |question|
    if question.q_type == "multichoice"
      choices = [Faker::Lorem.words(num = 3, supplemental = false).join(" "),Faker::Lorem.words(num = 3, supplemental = false).join(" "),Faker::Lorem.words(num = 3, supplemental = false).join(" "),Faker::Lorem.words(num = 3, supplemental = false).join(" ")].sample(rand(2..4))
      choices.each do |choice|
        Choice.create(c_title: choice, question_id: question.id)
      end
    end
  end
end


40.times do
  submissions = Survey.find(rand(1..10)).submissions << Submission.create(user_id: rand(1..20))
  survey = Survey.find(submissions.last.survey_id)
  survey.questions.each do |question|
    if question.q_type == "text"
      Response.create(submission_id: submissions.last.id, question_id: question.id, user_input: Faker::Lorem.words(num = 3, supplemental = false).join(" "))
    else
      choices = Question.find(question.id).choices
      Response.create(submission_id: submissions.last.id, question_id: question.id, choice_id: choices.sample.id)
    end
  end
end
