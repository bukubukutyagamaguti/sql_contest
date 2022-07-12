select
pr.PF_CODE as 都道府県コード,
pr.PF_NAME as 都道府県名,
ROUND(cast(cast(ho.INP_YES as REAL) / cast((ho.INP_YES + ho.INP_NO + ho.UNIDENTIFIED) as REAL) as REAL ) * 100, 1) as 入院率
from PREFECTURE as pr
inner join HOSPITALIZATION as ho on pr.PF_CODE = ho.PF_CODE
order by 入院率 desc, 都道府県コード asc
