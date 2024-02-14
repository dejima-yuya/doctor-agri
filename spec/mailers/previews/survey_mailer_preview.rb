# Preview all emails at http://localhost:3000/rails/mailers/survey_mailer
class SurveyMailerPreview < ActionMailer::Preview
  def notify_admin
    SurveyMailer.with(to: "test@example.com", name: "dic").notify_admin
  end
end