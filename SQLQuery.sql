

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

--�P��CASE��
CASE gender
    WHEN '�j' THEN 1
    WHEN '��' THEN 2
    ELSE 99
END

--����CASE��
CASE
    WHEN gender = '�j' THEN 1
    WHEN gender = '��' THEN 2
    ELSE 99
END

--tbl_staff����staff_sex�� 1�Ȃ�j�� 2�Ȃ珗�� �Ƃ��Ē��o(�P��CASE��)
SELECT 
*,
	case staff_sex
	when 1 then '�j��'
	when 2 then '����'
	end

FROM [project_job].[dbo].[tbl_staff]

--tbl_staff����staff_sex�� 1�Ȃ�j�� 2�Ȃ珗�� �Ƃ��Ē��o(����CASE��)
SELECT 
*,
	case 
	when staff_sex =  1 then '�j��'
	when staff_sex =  2 then '����'
	end '����' --end �̌�ɂ͐V�����J�������𖽖��ł���

FROM [project_job].[dbo].[tbl_staff]


--tbl_customer���犔����Ё����Ȃ�'�O��'�A����������ЂȂ�'�㊔'�Ƃ킯��
SELECT 
 *, 

 case 
 when customer_name like '�������%' then '�O��'
 when customer_name like '%�������' then '�㊔'
 end

FROM tbl_customer


--�s���{����n�敪��
CASE
    WHEN prefecture IN ('�k�C��') THEN '�k�C��'
    WHEN prefecture IN ('�X��', '��茧', '�{�錧', '�H�c��', '�R�`��', '������') THEN '���k'
    ...
    WHEN prefecture IN ('���ꌧ') THEN '����'
    ELSE NULL
END

--���ۂ̏Z���Ȃ�like�Œn�敪������Ƃ悢
SELECT 
 *, 
 case 
 when address like '�����s%' 
   or address like '��錧%' 
   or address like '�_�ސ쌧%'
  then '�֓�'
  when address like '���m��%' 
   or address like '�É���%' 
  then '����'
 else '���̂ق�'
 end 'area'

FROM tbl_customer


--�n�悲�Ƃ̌������W�v����
select 
 count(customer_name),
 case 
 when address like '�����s%' 
   or address like '��錧%' 
   or address like '�_�ސ쌧%'
  then '�֓�'
  when address like '���m��%' 
   or address like '�É���%' 
  then '����'
 else '���̂ق�'
 end 'area'

 from tbl_customer

group by 
 case 
 when address like '�����s%' 
   or address like '��錧%' 
   or address like '�_�ސ쌧%'
  then '�֓�'
  when address like '���m��%' 
   or address like '�É���%' 
  then '����'
 else '���̂ق�'
 end 