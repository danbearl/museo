class ContactMailer < ActionMailer::Base
  default from: "dan@laurabearl.com"
  default to: "dan.bearl@gmail.com"

  def new_message(message)
    @message = message
    mail(:subject => "[LauraBearl.com Contact]: #{message.subject}")
  end

end
