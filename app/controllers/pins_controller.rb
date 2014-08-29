class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_filter :correct_user, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user! 


  def index
      @pins = Pin.all.order("created_at DESC")

      @pins = current_user.pins.paginate(:page => params[:page], :per_page => 12)

      if current_user.try(:admin?)
        @pins = Pin.all.paginate(:page => params[:page], :per_page => 12)
      end
  end

  def show
  end

  def new
      @pin = current_user.pins.build
  end

  def edit
  end

  def create
    @pin = current_user.pins.build(pin_params)

      if @pin.save
        redirect_to @pin, notice: 'Pin was successfully created.' 
      else
        render action: 'new'
      end
  end

  def update
      if @pin.update(pin_params)
        redirect_to @pin, notice: 'Pin was successfully updated.' 
      else
        render action: 'edit'
      end
  end

  def destroy
    @pin.destroy
    redirect_to pins_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def correct_user
      if current_user.try(:admin?)
        @pin = Pin.find_by(id: params[:id])
      else
        @pin = current_user.pins.find_by(id: params[:id])
        redirect_to pins_url, notice: "Not authorized to view the image you requested" if @pin.nil?
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_params
      params.require(:pin).permit(:description, :image)
    end

end
