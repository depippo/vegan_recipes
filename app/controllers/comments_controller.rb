class CommentsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.build(comment_params)
    if @recipe.save
      respond_to do |f|
        f.html {redirect_to recipe_path(@recipe)}
        f.json {render :json => @comment}
      end
    else
      render "recipes/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :content)
  end

end
