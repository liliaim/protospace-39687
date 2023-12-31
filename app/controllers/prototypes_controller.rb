class PrototypesController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @prototypes = Prototype.all

  end
  def new
    @prototype = Prototype.new
  end
  def create
    @prototype = Prototype.new(prototype_params)

    if @prototype.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end

  end
  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new #追加
    @comments = @prototype.comments.includes(:user) #追加
  
  end
  def edit
    @prototype = Prototype.find(params[:id])
    unless current_user.id == @prototype.user_id
      redirect_to action: :index
    end

  end
  def update
    @prototype = Prototype.find(params[:id])

    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype.id)
    else
      render :_form, status: :unprocessable_entity, locals: { prototype: @prototype }
    end

  end
  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  private

  def prototype_params
    #imageという名前でアクセスできるようになった画像ファイルの保存を許可する
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end
