get '/survey_edit/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  erb :survey_edit
end

post '/survey_edit/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  @survey.update_attributes(title: params[:title])
    @question = @survey.questions

    puts params.inspect

      @question.each do |question|
        question.update_attributes(q_title: params[:add_question])
      end
  redirect to 'welcome/current_user.id'
end


