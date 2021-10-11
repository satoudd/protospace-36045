class PrototypesController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :authenticate_user!
  before_action :set_prototype, only: [:edit, :show]

  def index
    @prototypes = Prototype.includes(:user)
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
    redirect_to action: :index
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to action: :index
  end
 
  private
  def prototype_params
    params.require(:prototype).permit(:content, :title, :image, :cath_copy, :concept).merge(user_id: current_user.id)
  end
  
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
    def set_prototype
      @prototype = Prototype.find(params[:id])
  end
end
