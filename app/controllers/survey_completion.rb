get '/survey_stats/:survey_id' do


  if request.xhr?
    @survey = Survey.find(params[:survey_id])
    @questions = @survey.questions
    @responses = @questions.first.responses #this is going to be an array of responses
    # for this specific question.

      @response_freq = {}
        @responses.each do |response|
          if @response_freq.has_key?(response.user_input)
            @response_freq[response.user_input] += 1
          else
            @response_freq[response.user_input] = 1
          end

          p @response_freq

        end

    p "RESPONSES: #{@responses}"

      content_type :JSON
      {data: @response_freq}.to_json
  end

end


post "/submit_response/:survey_id" do
  @survey_taker = current_user
  @survey = Survey.find(params[:survey_id])
  @submission = Submission.create(survey_id: @survey.id)
  @survey.questions.last.responses.create(user_input: params[:response], submission_id: @submission.id)
  @survey_taker.submissions << @submission

  redirect to "/welcome/#{current_user.id}"


end


