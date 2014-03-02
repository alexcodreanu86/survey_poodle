class Mailer < ActionMailer::Base

  def create_email(args)
    @user_name = args[:user_name]
    @email = args[:email]
    @message = args[:message]
    @unique_link = args[:unique_link]
    @survey = args[:survey]
    mail(   :to      => @email,
            :from    => "poodlesurvey@gmail.com",
            :subject => "testing mail") do |format|
                format.html
    end
  end
end
