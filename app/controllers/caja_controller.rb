class CajaController < ApplicationController
  layout "caja"
  before_filter :authenticate_user!, :check_authorization

  def index
  end

  def cobrar
  end

  private
    def check_authorization
      authorize! :manage, Pago
    end
end
