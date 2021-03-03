class AnswersController < ApplicationController

  def new
    question = Question.find(params[:question_id])
    if question.user_id == current_user.id
      redirect_to request.referer || root_url and return
    end
    @question = question
    @answer = Answer.new
    # binding.pry
  end

  def create
    question_user_id = Question.find(answer_params[:question_id]).user_id
    if question_user_id == current_user.id
      redirect_to question_path(answer_params[:question_id]) || root_url and return
    end
    current_user.answers.create(answer_params)
    redirect_to question_path(answer_params[:question_id])
  end

  def edit
    answer = Answer.find(params[:id])
    if answer.user_id != current_user.id
      redirect_to question_path(answer.question_id) and return
    end
    @answer = Answer.find(params[:id])
  end

  def update
    answer = Answer.find(params[:id])
    if answer.user_id == current_user.id
      answer.update_attributes(answer_params)
    end
    redirect_to question_path(answer.question_id)
  end

  def destroy
    answer = Answer.find(params[:id])
    if answer.user_id == current_user.id
      answer.destroy
    end
    redirect_to question_path(answer.question.id) || root_url
  end

  private

  def answer_params
      params.require(:answer).permit(:answer, :explanation, :question_id)
  end

end
