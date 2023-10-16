class PostScriptCommentsController < ApplicationController
  def create
    @post_script_comment = current_end_user.post_script_comments.build(post_script_comment_params)
    @post_script = @post_script_comment.post_script
    @facility = @post_script.facility
    if @post_script_comment.save
      flash[:notice] = "success"
      redirect_to [@facility, @post_script]
    else
      @post_script_comments = @post_script.post_script_comments
      flash.now[:alert] = "failed"
      render 'post_scripts/show'
    end
  end

    def destroy
      comment = PostScriptComment.find(params[:id])
      comment.destroy
    end

  private
  def post_script_comment_params
    params.require(:post_script_comment).permit(:comment, :post_script_id)
  end
end
