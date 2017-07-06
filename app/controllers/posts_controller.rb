class PostsController < ApplicationController
  
  def oriindex
  end
  
  def index
  @posts=Post.all
  end
  
  def show
    @post=Post.find(params[:post_id])
    @comments=Comment.where(:post_id => params[:post_id])
  end
  
  def edit
    @post=Post.find(params[:post_id])
  end
  
  def update
    @post=Post.find(params[:post_id])
   @post.title=params[:input_title]
    @post.content=params[:input_content]
    @post.save
    redirect_to "/posts/show/#{@post.id}"
  end
  
  
  def destroy
    @post = Post.find(params[:post_id])
    @post.destroy
    redirect_to'/posts/index'
    
  end
  
  def new
  end
  
  def confirm
  end
  
  
  def create
    @post = Post.new
    @post.title =params[:input_title]
    @post.content =params[:input_content]
  
    uploader = NayanaUploader.new
    uploader.store!(params[:photo])                              # size: 1024x768
    #uploader.url # => '/url/to/my_file.png'               # size: 800x800
    @post.img_url = uploader.url 
  
    @post.save
    redirect_to '/posts/confirm'

  
  end
end
