class BookmarksController < ApplicationController

def create
  if Question.find(bookmark_params[:question_id]).user_id == current_user.id
    redirect_to request.referer || root_url and return
  end
  current_user.bookmarks.create!(bookmark_params)
  @question = Question.find(bookmark_params[:question_id])
  respond_to do |format|
  format.html { redirect_to request.referer }
  format.js
  end
  # redirect_to request.referer
end

def destroy
  if Question.find(bookmark_params[:question_id]).user_id == current_user.id
    redirect_to request.referer || root_url and return
  end
  current_user.bookmarks.find_by(bookmark_params).destroy!
  @question = Question.find(bookmark_params[:question_id])
  respond_to do |format|
  format.html { redirect_to request.referer }
  format.js
  end
  # redirect_to request.referer
end

private

def bookmark_params
  params.require(:bookmark).permit(:question_id, :user_id)
end

end
