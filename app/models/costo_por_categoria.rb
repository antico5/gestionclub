class CostoPorCategoria < ActiveRecord::Base
  belongs_to :periodo
  belongs_to :categoria

  validates_uniqueness_of :periodo_id, scope: :categoria_id

end
