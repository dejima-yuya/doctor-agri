class SurveyMailer < ApplicationMailer
  default from: 'notifications@example.com'
  
  def notify_admin
    @name = params[:name]
    mail(to: params[:to], subject: '新しいアンケート回答があります')
  end
end