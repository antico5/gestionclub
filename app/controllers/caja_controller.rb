class CajaController < ApplicationController
  layout "caja"
  before_filter :authenticate_user!, :authorize_user!

  def index
  end

  def cobrar
  end

  private
    def authorize_user!
      authorize CajaController
    end
end
