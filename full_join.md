```sql
with tgt as
(
select 1 as item_id, 'MM' as logistic_tag
union all
select 2 as item_id, 'MK' as logistic_tag
union all
select 2 as item_id, 'KK' as logistic_tag
union all
select 3 as item_id, 'KK' as logistic_tag
)
, src as
(
select 1 as item_id, 'MM' as logistic_tag
union all
select 2 as item_id, 'MK' as logistic_tag
union all
select 1 as item_id, null as logistic_tag
union all
select 2 as item_id, null as logistic_tag
union all
select 3 as item_id, null as logistic_tag
union all
select null as item_id, 'NN' as logistic_tag
)
select tgt.*, src.*
from tgt full join src on
	tgt.item_id = src.item_id and 
	tgt.logistic_tag = src.logistic_tag
```
![image](https://github.com/user-attachments/assets/40a9b2a1-371b-4c37-a843-89218a6c2e04)

