class CajaController < ApplicationController
  layout "caja"
  before_filter :authenticate_user!, :authorize_user!

  def index
  end

  def cobrar_por_socio
    @q = Socio.search(params[:q])
    @socios = @q.result.activos
  end

  private
    def authorize_user!
      authorize CajaController
    end
end
