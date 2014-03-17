class CajaController < ApplicationController
  layout "caja"
  before_filter :authenticate_user!, :authorize_user!

  def index
  end

  def cobrar_por_socio
    @q = Socio.search(params[:q])
    @socios = @q.result.activos
  end

  def cobrar_a_socio
    @socio = Socio.find params[:socio_id]
    @deudas = @socio.deudas.impagas
    @pago = Pago.new
  end

  private
    def authorize_user!
      authorize CajaController
    end
end
