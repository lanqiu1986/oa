class Income < ApplicationRecord
  establish_connection :qc
  self.table_name = 'ror_tongji_m_y'
end
