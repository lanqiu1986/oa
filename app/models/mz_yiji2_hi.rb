class MzYiji2Hi < ApplicationRecord
  establish_connection :qc
  self.table_name = 'mz_yiji2'
end
