class CategoriasController < InheritedResources::Base
  before_filter :authenticate_user!

  def permitted_params
      params.permit(:categoria => [:nombre])
    end
end
