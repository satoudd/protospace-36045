class PrototypesController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @prototypes = Prototype.all
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def new
    @prototype = Prototype.new
  end

  def create
  @prototype = Prototype.new(prototype_params)
  if @prototype.save
    redirect_to root_path
  else
    render :new
  end
  before_action :authenticate_user!
end

  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)

  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    prototype = Prototype.find(params[:id])
    prototype.update(prototype_params)
  end

  def destro
    prototype = Prototype.find(params[:id])
    prototype.destroy
  end
 
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end

  private
  def prototype_params
    params.require(:prototype).permit(:content, :title, :image, :cath_copy, :concept).merge(user_id: current_user.id)
  end
