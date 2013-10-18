# this will contain all survey creation
get '/create_survey' do
  @survey
  erb :create_survey
end

post '/create_survey' do

  short_link = Survey.generate_shortlink
  @survey = Survey.create(url: ("/survey/" + "#{short_link}"), title: params[:title], user_id: 1)
  p "THIS IS A SHORT LINK: #{short_link}"
  erb :survey_success
end

get '/survey/:url' do
  @survey_url = params[:url]
  p @survey = Survey.find_by_url("/survey/#{@survey_url}")
  erb :display_survey
end
