

--1行だけinsert
insert into tbl_staff_backup (staff_code,staff_name,staff_kana,resign_flag)
values ('000002','田中','タナカ',1)

--複数insert
insert into tbl_staff_backup (staff_code,staff_name,staff_kana,resign_flag)
values ('000002','田中','タナカ',1),('000003','山田','ヤマダ',0)

--tableごとinsert
insert into tbl_staff_backup (staff_code,staff_name,staff_kana,resign_flag)
select staff_code,staff_name,staff_kana,resign_flag
from tbl_staff

--1行だけupdate
update tbl_staff_backup set resign_flag = 0 where staff_code = '000001'

--複数update
update tbl_staff_backup set resign_flag = 0 where staff_code in ('000001','000002')

--すべてupdate
update tbl_staff_backup set resign_flag = 0 

--田中と山田以外を抽出
select * from tbl_staff_backup
where staff_name not in ('山田','田中')

--重複削除したカラムを抽出
SELECT 
distinct [tel]     
FROM [project_job].[dbo].[tbl_customer]

--tbl_customerから入力日が2012-10-01の件数はいくつか
select count(customer_name) from tbl_customer where input_date =  '2012-10-01' 

--tbl_customerから入力日ごとの件数はいくつか
select input_date, count(customer_name) from tbl_customer group by input_date

--tbl_customerから入力日ごとのrank別の件数はいくつか
select input_date,rank, count(customer_name) from tbl_customer group by input_date,rank