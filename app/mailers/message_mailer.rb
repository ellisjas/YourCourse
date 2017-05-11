class MessageMailer < ApplicationMailer

  def contact_me(message)
    @body = message.body

    mail to: "ellis.jas48@gmail.com", from: message.email
  end
  
end
