post "/submit_response/:survey_id" do
  @survey_taker = current_user
  @survey = Survey.find(params[:survey_id])
  @submission = Submission.create(survey_id: @survey.id)
  @survey.questions.last.responses.create(user_input: params[:response], submission_id: @submission.id)
  @survey_taker.submissions << @submission

  redirect to "/welcome/#{current_user.id}"


end


