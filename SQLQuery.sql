

--1�s����insert
insert into tbl_staff_backup (staff_code,staff_name,staff_kana,resign_flag)
values ('000002','�c��','�^�i�J',1)

--����insert
insert into tbl_staff_backup (staff_code,staff_name,staff_kana,resign_flag)
values ('000002','�c��','�^�i�J',1),('000003','�R�c','���}�_',0)

--table����insert
insert into tbl_staff_backup (staff_code,staff_name,staff_kana,resign_flag)
select staff_code,staff_name,staff_kana,resign_flag
from tbl_staff

--1�s����update
update tbl_staff_backup set resign_flag = 0 where staff_code = '000001'

--����update
update tbl_staff_backup set resign_flag = 0 where staff_code in ('000001','000002')

--���ׂ�update
update tbl_staff_backup set resign_flag = 0 

--�c���ƎR�c�ȊO�𒊏o
select * from tbl_staff_backup
where staff_name not in ('�R�c','�c��')

--�d���폜�����J�����𒊏o
SELECT 
distinct [tel]     
FROM [project_job].[dbo].[tbl_customer]

--tbl_customer������͓���2012-10-01�̌����͂�����
select count(customer_name) from tbl_customer where input_date =  '2012-10-01' 

--tbl_customer������͓����Ƃ̌����͂�����
select input_date, count(customer_name) from tbl_customer group by input_date

--tbl_customer������͓����Ƃ�rank�ʂ̌����͂�����
select input_date,rank, count(customer_name) from tbl_customer group by input_date,rank