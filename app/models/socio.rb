class Socio < ActiveRecord::Base
  include SociosHelper

  after_initialize :inicializar

  belongs_to :categoria
  has_many :deudas
  has_many :pagos, through: :deudas

  validates :categoria, presence: true
  validates :nombre, presence: true
  validates :dni, presence: true, uniqueness: true

  scope :activos, -> {where(activo: true)}

  def generar_deuda periodo
    monto = monto_por_periodo periodo
    Deuda.create(socio: self, periodo: periodo, monto: monto)
  end

  def inicializar
    if self.new_record?
  	  self.activo ||= true #el operador ||= setea un valor al especificado solo si era nil
  	  self.fecha_alta ||= Date.today.to_date
  	end
  end

  def saldo_cuenta
    balance.saldo
  end

  def listar_cuenta_corriente
    balance.listado
  end

  def al_dia?
     deudas.detect {|deuda| deuda.vencida?} == nil
  end

  delegate :monto_por_periodo, to: :categoria, prefix: false, allow_nil: true

  private

    def balance
      @balance ||= Balance.new deudas
    end

end
