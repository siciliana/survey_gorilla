# this will contain all survey creation
get '/create_survey' do
  @survey
  erb :create_survey
end

get '/survey/:url' do
  @survey_url = params[:url]

  @survey = Survey.find_by_url("/survey/#{@survey_url}")
  erb :display_survey
end

post '/create_survey' do

  short_link = Survey.generate_shortlink

  @survey = Survey.find_or_create_by_title(params[:title])
  if @survey.url == nil
    @survey.update_attributes(url: ("/survey/" + "#{short_link}"))
  else
    @survey
  end

  @question = Question.create(q_type: "text", q_title: params[:add_question], survey_id: @survey.id)

    if params[:question_action] == "Add another question"

      @survey.questions << @question
      @survey.save
      current_user.surveys << @survey

      redirect to '/create_survey'


    else
      params[:question_action] == "Submit survey"

      erb :survey_success
    end
end


