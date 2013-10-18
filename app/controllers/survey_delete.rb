get "/survey_delete/:survey_id" do
  @survey = Survey.find(params[:survey_id])
  @survey.destroy
  redirect to "/welcome/#{current_user.id}"
end

