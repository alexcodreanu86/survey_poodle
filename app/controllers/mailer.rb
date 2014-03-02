get "/email/:survey_id" do
  redirect to "/" if !current_user?
  @survey_id = params[:survey_id]
  erb :"email_views/add_email"
end

post "/email/:survey_id" do
  redirect to "/" if !current_user?
  @survey = Survey.find(params[:survey_id])
  @emails = params[:emails].strip.split(",").map(&:strip)
  @user_name = current_user.name
  @emails.each do |email|
    if valid_email(email)
      link = Link.create(survey_id: @survey.id)

      the_email = Mailer.create_email(user_name: @user_name,
                                      email: email,
                                      survey: @survey.title,
                                      message: params[:message],
                                      unique_link: link.unique_link)
      the_email.deliver
    else
      @errors = {incorrect_email: ["At list one email was invalid"]}
    end
  end
  redirect to("/user/#{current_user.id}")
end
