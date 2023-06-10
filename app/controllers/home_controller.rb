class HomeController < ApplicationController

  def set_device
    device_id = id_params
    session[:device_id] = device_id
    redirect_to root_path
  end

  def index
  end


  private

    def id_params
      params.permit(:id)['id']
    end

end
