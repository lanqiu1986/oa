class MzChufang2Hi < ApplicationRecord
  establish_connection :qc
  self.table_name = 'mz_chufang2'
end
