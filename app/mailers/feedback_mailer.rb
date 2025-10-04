class FeedbackMailer < ApplicationMailer
  default to: -> { Admin.pluck(:email) }

  def feedback_email(feedback)
    @feedback = feedback

    mail(
      subject: t("feedbacks.message")
    )
  end
end
