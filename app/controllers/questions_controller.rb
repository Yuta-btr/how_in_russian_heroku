class QuestionsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show, :search]

  def index
    questions = Question.joins(:answers).includes(:answers).order('answers.created_at desc').distinct
    @questions = questions.page(params[:page]).per(20)
  end

  def my_bookmark
    questions = current_user.bookmark_questions.order('bookmarks.created_at desc')
    @questions = questions.page(params[:page]).per(20)
  end

  def my_question
    questions = current_user.questions.order('created_at desc')
    @questions = questions.page(params[:page]).per(20)
  end

  def no_answer
    questions = Question.left_joins(:answers).select('questions.*').where('answers.answer is null')
    @questions = questions.page(params[:page]).per(20)
  end

  def search
    results = Question.where(['question LIKE ?', "%#{params[:search]}%"])
    results += Question.left_joins(:answers).select('questions.*').where(['answer LIKE ?', "%#{params[:search]}%"])
    questions = results.uniq.sort_by{|q| q.created_at}.reverse
    @questions = Kaminari.paginate_array(questions).page(params[:page]).per(20)
  end

  def new
    @question = Question.new
  end

  def create
    current_user.questions.create!(question_params)
    redirect_to root_url
  end

  def edit
    question = Question.find(params[:id])
    if question.user_id != current_user.id || question.answers.exists?
      redirect_to request.referer || root_url
    end
    @question = question
  end

  def update
    question = Question.find(params[:id])
    if question.user_id == current_user.id && question.answers.empty?
      question.update_attributes(question_params)
    end
    redirect_to question_path(params[:id]) || root_url
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
  end

  def destroy
    question = Question.find(params[:id])
    if question.user_id == current_user.id
      question.destroy
    end
    redirect_to request.referer || root_url
  end

  private

  def question_params
    params.require(:question).permit(:question, :explanation, :user_id)
  end

end
