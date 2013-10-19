# this will contain all survey creation
get '/create_survey' do
  @survey
  erb :create_survey
end

post '/create_survey' do

  short_link = Survey.generate_shortlink
  @survey = Survey.create(url: ("/survey/" + "#{short_link}"), title: params[:title], user_id: 1)
  @question = Question.create(q_type: "text", q_title: params[:add_question], survey_id: @survey.id)


  @survey.questions << @question
  current_user.surveys << @survey



  erb :survey_success
end

get '/survey/:url' do
  @survey_url = params[:url]

  @survey = Survey.find_by_url("/survey/#{@survey_url}")
  erb :display_survey
end
