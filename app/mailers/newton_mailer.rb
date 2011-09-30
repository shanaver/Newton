class NewtonMailer < ActionMailer::Base
  
  default :from => "Newton <donotreply@donately.com>", #change this once we set a new one up at postmark
  :reply_to => 'donotreply@donately.com',
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
