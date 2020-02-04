class ImagesController < ApplicationController
  # Esto se ejecutaro solo en el momento de que se usen las acciones descritas
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  def index
    @images = Image.all
  end

  # new : Mostrue el formulario para crear una imagen
  def new
    @image = Image.new
  end

  # create: recibe toda la informacion del formulario
  def create
    # Manipula los parametros que se reciben
    #render plain: params[:image].inspect
    
    @image = Image.new image_params
    if @image.save
      redirect_to images_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @image.update image_params
    redirect_to images_path
  end

  def show
  end

  def destroy
    @image.destroy

    redirect_to images_path
  end

  def set_image
    @image = Image.find params[:id]
  end

  private

  def image_params
    params.require(:image).permit(:description, :picture)
  end

end
