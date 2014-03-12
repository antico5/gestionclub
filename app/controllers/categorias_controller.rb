class CategoriasController < InheritedResources::Base
  before_filter :authenticate_user!, :authorize_user!

  private

    def permitted_params
      params.permit(:categoria => [:nombre])
    end

    def authorize_user!
      authorize Categoria
    end
end
