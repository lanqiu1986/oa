class HisController < ApplicationController
  def index
    @his = Hi.connection.select_values("select jiaoyilx from mz_guahao1 where guahaorq >= to_date(to_char(sysdate,'yyyy-mm-dd')||' 00:00:00','yyyy-mm-dd hh24:mi:ss')")
  end
end
