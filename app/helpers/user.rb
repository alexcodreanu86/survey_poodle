def current_user?
  session[:user_id]
end

def current_user
  User.find(session[:user_id])
end

def selected(cat)
	@survey.category == cat ? "selected" : nil
end

def is_public?(value)
  @survey.is_public == value ?  "checked" : nil
end

def has_taken_survey?(survey)
  !survey.participations.where(user_id: current_user?).empty?
end


def valid_email(email)
  email =~ /\A\w*\w{3}+@\w{3}\w*\.\w{2}\w*\z/ ? true : false
end
