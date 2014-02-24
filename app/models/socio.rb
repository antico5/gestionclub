class Socio < ActiveRecord::Base
  belongs_to :categoria
  has_many :deudas
end
