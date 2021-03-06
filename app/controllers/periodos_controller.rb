class PeriodosController < InheritedResources::Base
  before_filter :authenticate_user!, :authorize_user!


  def generar_deuda
    @periodo = Periodo.find params[:id]
    @periodo.generar_deuda_a_socios_activos
    PeriodosMailer.notify_liquidation(@periodo,current_user).deliver
    flash[:notice] = "Generadas deudas a socios para el periodo '"+@periodo.nombre+"'. Total generadas: "+ Deuda.where(periodo: @periodo).count.to_s
    redirect_to periodos_path
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def permitted_params
      params.permit(:periodo => [:nombre, :fecha_vencimiento, :costo_por_categorias, costo_por_categorias_attributes: [:id, :categoria_id, :costo]])
    end

    def authorize_user!
      authorize Periodo
    end
end
