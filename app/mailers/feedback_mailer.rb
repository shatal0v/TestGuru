class FeedbackMailer < ApplicationMailer
  def sent_feedback(data,user_email,subject)
    admin_email = Admin.first.email
    @data = data
    mail from: user_email, to: admin_email, subject: subject
  end
end
