module SociosHelper
  def yes_no_icon(bool)
    if bool
       '<i class="icon-ok"></i>'.html_safe
    else
       '<i class="icon-remove"></i>'.html_safe
    end
  end

  class RenglonCuenta
    attr_accessor :fecha, :concepto, :debe, :haber

    def initialize(params = {})
      @fecha = params[:fecha]
      @concepto = params[:concepto]
      @concepto ||= "Sin concepto"
      @debe = params[:debe]
      @debe ||= 0
      @haber = params[:haber]
      @haber ||= 0
    end
  end
end
