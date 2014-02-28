class PeriodosController < InheritedResources::Base
  before_filter :authenticate_user!
  
  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def permitted_params
      params.permit(:periodo => [:nombre, :fecha_vencimiento])
    end
  
end
