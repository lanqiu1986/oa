class MzGuahao1HisController < ApplicationController


  def index
    # @rcs = MzGuahao1Hi.limit(10)

  #  @mzguahao1his = MzGuahao1Hi.joins("
  #  INNER JOIN mz_shoufei1
  #   ON mz_guahao1.shoufeiid = mz_shoufei1.shoufeiid
  #   and mz_shoufei1.shoufeirq >= to_date(to_char(sysdate,'yyyy-mm-dd')||' 00:00:00','yyyy-mm-dd hh24:mi:ss')
  #   ").sum('jiaoyilx')

    #@mzguahao1his = MzGuahao1Hi.connection.select_values("select jiaoyilx from mz_guahao1 where guahaorq between to_date('2017-07-01 00:00:00','yyyy-mm-dd hh24:mi:ss') and to_date('2017-07-01 23:00:00','yyyy-mm-dd hh24:mi:ss')")

    @mzguahao1his = MzGuahao1Hi.connection.select_values("
      select a.jiaoyilx
      from mz_guahao1 a , mz_shoufei1 b
      where a.shoufeiid = b.shoufeiid
      and b.shoufeirq >= to_date(to_char(sysdate,'yyyy-mm-dd')||'00:00:00','yyyy-mm-dd hh24:mi:ss')
      ")

  end
end
