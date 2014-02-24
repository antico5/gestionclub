class Deuda < ActiveRecord::Base
  belongs_to :socio
  belongs_to :periodo
  has_many :pagos

end
