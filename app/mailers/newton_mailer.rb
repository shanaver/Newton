class NewtonMailer < ActionMailer::Base
  
  default :from => "Newton <" + Newton::Application.config.postmark_signature + ">", 
  :reply_to => Newton::Application.config.postmark_signature,
  :tag     => 'newton'
  
  def content_editor_link(user, newt)
    @user = user
    @newt = newt
    to = user.email
    subject = "NewtonApp: You are the editor for some important content"
    if user.email.present?
      mail( :to => to, 
            :subject => subject
          )
    end
  end
end
