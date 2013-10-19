post "/submit_response/:survey_id" do
  @survey_taker = current_user
  @survey = Survey.find(params[:survey_id])
  @submission = Submission.create(survey_id: @survey.id)

  @survey.questions.each_with_index do |question,index|
    question.responses.create(user_input: params[:response][index.to_s], submission_id: @submission.id)
  end
  
  


  @survey_taker.submissions << @submission

  redirect to "/welcome/#{current_user.id}"


end


