

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

--単純CASE式
CASE gender
    WHEN '男' THEN 1
    WHEN '女' THEN 2
    ELSE 99
END

--検索CASE式
CASE
    WHEN gender = '男' THEN 1
    WHEN gender = '女' THEN 2
    ELSE 99
END

--tbl_staffからstaff_sex列が 1なら男性 2なら女性 として抽出(単純CASE式)
SELECT 
*,
	case staff_sex
	when 1 then '男性'
	when 2 then '女性'
	end

FROM [project_job].[dbo].[tbl_staff]

--tbl_staffからstaff_sex列が 1なら男性 2なら女性 として抽出(検索CASE式)
SELECT 
*,
	case 
	when staff_sex =  1 then '男性'
	when staff_sex =  2 then '女性'
	end '性別' --end の後には新しいカラム名を命名できる

FROM [project_job].[dbo].[tbl_staff]


--tbl_customerから株式会社○○なら'前株'、○○株式会社なら'後株'とわける
SELECT 
 *, 

 case 
 when customer_name like '株式会社%' then '前株'
 when customer_name like '%株式会社' then '後株'
 end

FROM tbl_customer


--都道府県を地域分け
CASE
    WHEN prefecture IN ('北海道') THEN '北海道'
    WHEN prefecture IN ('青森県', '岩手県', '宮城県', '秋田県', '山形県', '福島県') THEN '東北'
    ...
    WHEN prefecture IN ('沖縄県') THEN '沖縄'
    ELSE NULL
END

--実際の住所ならlikeで地域分けするとよい
SELECT 
 *, 
 case 
 when address like '東京都%' 
   or address like '茨城県%' 
   or address like '神奈川県%'
  then '関東'
  when address like '愛知県%' 
   or address like '静岡県%' 
  then '中部'
 else 'そのほか'
 end 'area'

FROM tbl_customer


--地域ごとの件数を集計する
select 
 count(customer_name),
 case 
 when address like '東京都%' 
   or address like '茨城県%' 
   or address like '神奈川県%'
  then '関東'
  when address like '愛知県%' 
   or address like '静岡県%' 
  then '中部'
 else 'そのほか'
 end 'area'

 from tbl_customer

group by 
 case 
 when address like '東京都%' 
   or address like '茨城県%' 
   or address like '神奈川県%'
  then '関東'
  when address like '愛知県%' 
   or address like '静岡県%' 
  then '中部'
 else 'そのほか'
 end 