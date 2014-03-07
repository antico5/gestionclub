class Balance

  RenglonCuenta = Struct.new(:fecha, :concepto, :debe, :haber)

  attr_accessor :deudas, :pagos

  def initialize deudas
    @deudas = deudas
  end

  def listado
    renglones = (deudas + pagos).map { |movimiento| crear_renglon movimiento}
    ordenar_por_fecha renglones
  end

  def saldo
    calcular_saldo
  end

  private

    def crear_renglon movimiento
      debe = (movimiento.kind_of? Pago) ? movimiento.monto : 0
      haber = (movimiento.kind_of? Deuda) ? movimiento.monto : 0
      RenglonCuenta.new movimiento.created_at, movimiento.concepto, debe, haber
    end

    def ordenar_por_fecha renglones
      renglones.sort! { |a,b| a.fecha <=> b.fecha}
    end

    def calcular_saldo
      deudas.sum(:monto) - (pagos.map{ |pago| pago.monto }).inject(:+).to_f
    end

    def pagos
      @pagos ||= deudas.map { |deuda| deuda.pagos.to_a }.flatten
    end

end
