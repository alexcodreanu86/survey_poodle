get "/surveys/participate/:survey_id" do
  redirect to "/" if !current_user?
  @survey = Survey.find(params[:survey_id])
  redirect to "/" if has_taken_survey?(@survey)
  @questions = @survey.questions
  erb :"survey_views/show"
end

get  "/surveys/participate_link" do
  @link = Link.find_by( unique_link: params[:link] )
  if @link.participation
    @errors = {used_link: ["This link has already been used"]}
    erb :index
  else
    @survey = @link.survey
    @questions = @survey.questions
    erb :"survey_views/show"
  end
end

get "/surveys/edit/:survey_id" do
  @survey = Survey.find(params[:survey_id])
  redirect to "/" if !current_user? && current_user.id != @survey.user_id
  @questions = @survey.questions
  if session[:user_id] == @survey.user_id
    erb :"survey_views/edit"
  else
    redirect to('/')  #user errors
  end
end

get "/surveys/stats/:survey_id" do
  redirect to "/" if !current_user?
  @survey = Survey.find(params[:survey_id])
  @questions = @survey.questions
  erb :"survey_views/stats"
end

get "/surveys/index" do
  redirect to "/" if !current_user?
  @surveys = Survey.all
  erb :"survey_views/index"
end

get '/surveys/new' do
  redirect to "/" if !current_user?
  @survey = Survey.create(user_id: session[:user_id], title: "Title",is_public: params[:is_public], category: params[:category])
  redirect to("/surveys/edit/#{@survey.id}")
end

get '/surveys/delete/:survey_id' do
  redirect to "/" if !current_user?
  @survey = Survey.find(params[:survey_id])
  if session[:user_id] == @survey.user_id
    @survey.destroy
    redirect to("/user/#{session[:user_id]}")
  else
    redirect to('/')
  end
end

# post '/surveys/delete' do
#   @survey = Survey.find(params[:survey_id])
#   if session[:user_id] == @survey.user_id
#     @survey.destroy
#     redirect to("/user/#{session[:user_id]}")
#   else
#     redirect to('/')
#   end
# end



post '/surveys/submit/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  @p = Participation.create(user_id: session[:user_id], survey_id: @survey.id)
  if @p
    params[:survey].each do |quest_id, answer|
      Response.create(participation_id: @p.id, question_id: quest_id, content: answer)
    end
    redirect to("/user/#{current_user?}")
  end
end

post '/surveys/submit_link/:link' do
  @link = Link.where(unique_link: params[:link]).first
  if @link
    @survey = @link.survey
    @p = Participation.create(user_link: params[:link], survey_id: @survey.id)
    if @p
      params[:survey].each do |quest_id, answer|
        Response.create(participation_id: @p.id , question_id: quest_id, content: answer)
      end
      redirect to("/")
    end
  else
    @errors = @link.errors.messages
    redirect to "/"
  end
end

post '/surveys/edit/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  if session[:user_id] == @survey.user_id
    @survey.update_attributes(params[:survey])
    redirect to("/surveys/edit/#{@survey.id}")
  else
    redirect to('/')  #user errors
  end
end
