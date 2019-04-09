class MailsController < ApplicationController
  skip_before_action :verify_authenticity_token 

  def feedback; end

  def sent
    data = params[:body]
    subject = params[:subject]
    user = current_user.email
    
    FeedbackMailer.sent_feedback(data,user,subject).deliver
    redirect_to root_path
  end
end
