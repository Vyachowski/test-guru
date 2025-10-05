class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.valid?
      FeedbackMailer.with(feedback: @feedback).send_feedback.deliver_later

      redirect_to new_feedback_path, notice: t("feedbacks.sent")
    else
      flash.now[:alert] = t("feedbacks.fill_all_fields")
      render :new, status: :unprocessable_entity
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:name, :email, :body)
  end
end
