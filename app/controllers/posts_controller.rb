class PostsController < ApplicationController 
    before_action :find_post, only: [:show,:edit,:update,:destroy, :new]
    before_action :authenticate_user!
    before_action :correct_user,only: [:edit,:destroy,:update]
    def index
        @posts = Post.all
        @user = User.limit(5)
        @post = Post.new
    end
    
    def new
    end

    def create
        @post = Post.create(post_params)
        if @post.save
            redirect_to post_path(@post.id),notice: 'Posted!'
        else
            render :_new,status: :bad_request
        end
    end

    def show
       @comment = @post.comments.order('Created_at DESC')
       @like = @post.likes.order('Created_at DESC')
    end

    def edit
    end

    def update
        if @post.update(post_params)
            redirect_to post_path(@post.id),notice: 'Post Updated!'
           else
               render :edit,status: :bad_request
           end
    end

    def destroy
        if @post.destroy
            redirect_to root_path,alert: 'Post Deleted!'
        end
    end

    private

    def post_params
        params.require(:post).permit(:title,:description, :image, :user_id)
    end

    def correct_user
        @post = current_user.posts.find_by(id: params[:id])
        redirect_to posts_path,alert: 'Not Authorized!' if @post.nil?
    end

    def find_post
        @post = Post.find_by(id: params[:id])
    end

end