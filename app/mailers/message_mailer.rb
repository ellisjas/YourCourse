class MessageMailer < ApplicationMailer

  def contact_me(message)
    @body = message.body

    mail to: "s3449107@student.rmit.edu.au", from: message.email
  end
  
end
