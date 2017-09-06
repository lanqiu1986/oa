class RorTongjiMYHi < ApplicationRecord
  establish_connection :qc
  self.table_name = 'ror_tongji_m_y'
end
#暂未使用此model，因为出现未初始化的常量错误
