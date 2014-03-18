class PagosController < InheritedResources::Base
  before_filter :authenticate_user!, :authorize_user!

  def create
    create!{ caja_cobrar_por_socio_path}
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def permitted_params
      params.permit(:pago => [:monto, :deuda_id])
    end

    def authorize_user!
      authorize Pago
    end

end
