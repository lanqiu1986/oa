class Hi < ApplicationRecord
  establish_connection :qc
  self.table_name = 'mz_guahao1'
end
