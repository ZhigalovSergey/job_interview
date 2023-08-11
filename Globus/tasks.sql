
drop table if exists tbl_a
go

select 1 as c1
into tbl_a
union all
select 2 as c1
union all
select 5 as c1
union all
select 8 as c1
union all
select null as c1
union all
select null as c1

select * from tbl_a

drop table if exists tbl_b
go

select 1 as c1
into tbl_b
union all
select 1 as c1
union all
select 2 as c1
union all
select 2 as c1
union all
select 2 as c1
union all
select 3 as c1

select * from tbl_b

select *
from tbl_a
left join tbl_b on tbl_a.c1 = tbl_b.c1

select *
from tbl_a
inner join tbl_b on tbl_a.c1 = tbl_b.c1 or tbl_a.c1 = 8

select *
from tbl_a, tbl_b
where tbl_a.c1 = tbl_b.c1 or tbl_a.c1 = 8

select *
from tbl_a
left join tbl_b on tbl_a.c1 = tbl_b.c1 or tbl_b.c1 = 3

select *
from
(
	select *, row_number() over(partition by c1 order by c1) rn
	from tbl_a
) t
where t.rn = 1
