class SalonController < ApplicationController
  def new
    @salon = Salon.new
  end

  def create
    @salon = Salon.new(salon_params)
    @salon.user = current_user
    if @salon.save
      redirect_to root_path
      flash[:notice] = "Salon added successfully"
    else
      flash[:notice] = @location.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def salon_params
    params.require(:salon).permit(:name, :address, :city, :state, :zip_code, :neighborhood, :phone_number, :url, :user)
  end
end
