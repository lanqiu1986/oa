class MzGuahao2Hi < ApplicationRecord
  establish_connection :qc
  self.table_name = 'mz_guahao2'
end
