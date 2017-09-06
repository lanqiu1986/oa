class HisController < ApplicationController
  layout 'his'

  def index
    @rc = MzGuahao1Hi.connection.select_values("
      select sum(a.jiaoyilx)
      from mz_guahao1 a, mz_shoufei1 b
      where a.shoufeiid = b.shoufeiid
      and b.shoufeirq >= to_date(to_char(sysdate,'yyyy-mm-dd')||'00:00:00','yyyy-mm-dd hh24:mi:ss')
      ")
    @mz = MzYiji2Hi.connection.select_values("
        select sum(feiyonghj)
        from mz_shoufei1
        where  shoufeirq >= to_date(to_char(sysdate,'yyyy-mm-dd')||'00:00:00','yyyy-mm-dd hh24:mi:ss')
        ")

    @zy = ZyFeiyong1Hi.connection.select_values("
              select sum(jiesuanje)
              from zy_feiyong1
              where hesuanxm<>29
              and jifeirq >= to_date(to_char(sysdate,'yyyy-mm-dd')||'00:00:00','yyyy-mm-dd hh24:mi:ss')
              ")
    @rc_m = Income.connection.select_values("
              select sum(rc_m)
              from ror_tongji_m_y
              ")
    @mz_m = Income.connection.select_values("
              select sum(mz_m)
              from ror_tongji_m_y
              ")
    @zy_m = Income.connection.select_values("
              select sum(zy_m)
              from ror_tongji_m_y
              ")
    @rc_y = Income.connection.select_values("
              select sum(rc_y)
              from ror_tongji_m_y
              ")
    @mz_y = Income.connection.select_values("
              select sum(mz_y)
              from ror_tongji_m_y
              ")
    @zy_y = Income.connection.select_values("
              select sum(zy_y)
              from ror_tongji_m_y
              ")
  end
end
