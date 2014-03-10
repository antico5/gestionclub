class CategoriasController < InheritedResources::Base
  before_filter :authenticate_user!

  load_and_authorize_resource
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to categorias_path, :alert => exception.message
  end

  def permitted_params
      params.permit(:categoria => [:nombre])
    end
end
