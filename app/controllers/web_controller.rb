class WebController < ApplicationController
  def redirigir
    if !user_signed_in?
      redirect_to new_user_session_path
    elsif Rol.check_rol current_user, :cajero
      redirect_to caja_index_path
    elsif Rol.check_rol current_user, :administrador
      redirect_to socios_path
    else
      sign_out
      flash[:error] = "Usted no tiene permiso para realizar acciones"
      redirect_to root_path
    end
  end
end
