class PostsController < ApplicationController
 


  def new
  	@post = Post.new
  end

  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
  end

  def create
  	@post = Post.new(permit_post)
  	if @post.save
  		flash[:success] = "Success!"
  		redirect_to post_path(@post)
  	else
  		flash[:error] = @post.error.full_message
  		redirect_to new_post_path
  	end
  end

  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def permit_post
  	params.require(:post).permit(:image, :description)
  end




end