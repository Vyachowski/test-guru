class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    feedback_params = params.require(:feedback).permit(:name, :email, :body)
    @feedback = Feedback.new(feedback_params)

    if @feedback.valid?
      FeedbackMailer.feedback_email(@feedback).deliver_now
      redirect_to new_feedback_path, notice: "Сообщение отправлено!"
    else
      flash.now[:alert] = "Заполните все поля"
      render :new, status: :unprocessable_entity
    end
  end
end
