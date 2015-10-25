class RecieversController < ApplicationController
  def edit
  end

  def create
  end

  def update
    @reciever = Reciever.find params[:id]
    @reciever.update reciever_params
  end

  protected

    def reciever_params
      params.require(:reciever).permit(:name, :address, :telephone)
    end
end
