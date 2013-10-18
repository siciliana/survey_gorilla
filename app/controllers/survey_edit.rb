get '/survey_edit/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  erb :survey_edit
end
