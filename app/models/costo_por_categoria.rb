class CostoPorCategoria < ActiveRecord::Base
  belongs_to :periodo
  belongs_to :categoria
end
