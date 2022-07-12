select
po.DISTRICT_NAME as 都道府県名,
po.TOTAL_AMT as 総人口
from POPULATION as po
where po.LVL = 2
order by 総人口 desc
