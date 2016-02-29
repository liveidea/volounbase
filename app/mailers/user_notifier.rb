class UserNotifier < ApplicationMailer
  # TODO: !!! need customize SMTP or Mandrill now work letter_opener gem !!!
  default from: "volounteer@finder.com"
  # To organizer
  def new_user_register_to_event(user, project)
    @user = user
    @project = project
    mail(to: @user.email, subject: 'New User Registered to event')
  end  

  # To volounteer
  def register_to_event(user, project)
    @user = user
    @project = project
    mail(to: @user.email, subject: 'You Registered to event')
  end

  # TODO: optimize code can just send status
  def decline_user_register_to_event(user, project)
    @user = user
    @project = project
    mail(to: @user.email, subject: 'You Declined Registered to event')
  end

  def accept_user_register_to_event(user, project)
    @user = user
    @project = project
    mail(to: @user.email, subject: 'You Accepted Registered to event')
  end

end
