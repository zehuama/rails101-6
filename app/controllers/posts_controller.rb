class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_group
  before_action :member_required, only: [:new, :create]
  def new
    @post = @group.posts.new
  end

  def create
    @post = @group.posts.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to group_path(@group), notice: "新增文章成功！"
    else
      render :new
    end
  end

  def edit
    @post = @group.posts.find(params[:id])
  end

  def update
    @post = @group.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to group_path(@group), notice: "编辑文章成功"
    else
      render :edit
    end
  end

  def destroy
    @post = @group.posts.find(params[:id])
    @post.destroy
    redirect_to group_path(@group), alert: "文章已删除"
  end

  private

  def member_required
    if !current_user.is_member_of?(@group)
      flash[:warning] = "你不是本讨论版成员，不能发文哦！"
      redirect_to group_path(@group)
    end
  end

  def find_group
    @group = Group.find(params[:group_id])
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
