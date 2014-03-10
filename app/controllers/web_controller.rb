class WebController < ApplicationController
  def redirigir
    if !user_signed_in?
      redirect_to new_user_session_path
    elsif current_user.cajero?
      redirect_to caja_index_path
    else
      redirect_to socios_path
    end
  end
end
